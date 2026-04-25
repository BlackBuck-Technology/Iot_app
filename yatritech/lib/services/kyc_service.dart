import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yatritech/utils/api_constants.dart';

class KycService {
  final String token;
  KycService({required this.token});

  Map<String, String> get _authHeaders => {
    'Authorization': 'Bearer $token',
    'Accept': 'application/json',
  };

  //Fetch Current KYC status
  Future<Map<String, dynamic>> getMyKyc() async {
    final url = Uri.parse(
      '${ApiConstants.baseUrlForKyc}${ApiConstants.kycStatusEndpoint}',
    );
    final response = await http.get(url, headers: _authHeaders);
    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['success']) return data;
    throw Exception(data['message'] ?? "Failed to load KYC");
  }

  //Save Personal Step
  Future<Map<String, dynamic>> savePersonalStep({
    required Map<String, String> textFields,
    required String photoFilePath,
  }) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrlForKyc}${ApiConstants.saveKycPersonalEndpoint}',
    );

    //it takes both text and files in one request
    final request = http.MultipartRequest('PUT', url);

    //merging _authHeaders with 'Content-Type: multipart/form-data' that http.MultipartRequest give by default
    request.headers.addAll(_authHeaders);

    //add text fields
    request.fields.addAll(textFields);

    //add image
    request.files.add(
      await http.MultipartFile.fromPath('photo', photoFilePath),
    );

    //send request
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) return data;
    throw Exception(data['message'] ?? "Failed to upload");
  }

  //SAVE CITIZENSHIP STEP
  Future<Map<String, dynamic>> saveCitizenship({
    required Map<String, String> textFields,
    required String frontPhotoPath,
    required String backPhotoPath,
  }) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrlForKyc}${ApiConstants.saveKycCitizenshipEndpoint}',
    );
    final request = http.MultipartRequest('PUT', url);

    request.headers.addAll(_authHeaders);
    request.fields.addAll(textFields);
    request.files.add(
      await http.MultipartFile.fromPath('frontPhoto', frontPhotoPath),
    );
    request.files.add(
      await http.MultipartFile.fromPath('backPhoto', backPhotoPath),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) return data;
    throw Exception(data['message'] ?? 'Failed to upload');
  }
}
