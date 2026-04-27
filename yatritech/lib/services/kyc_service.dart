import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yatritech/utils/api_constants.dart';
import 'package:http_parser/http_parser.dart';

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
      await http.MultipartFile.fromPath(
        'photo',
        photoFilePath,
        contentType: MediaType('image', 'jpeg'),
      ),
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
      await http.MultipartFile.fromPath(
        'frontPhoto',
        frontPhotoPath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
        'backPhoto',
        backPhotoPath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) return data;
    throw Exception(data['message'] ?? 'Failed to upload');
  }

  //SAVE LICENSE STEP
  Future<Map<String, dynamic>> saveLicense({
    required Map<String, String> textFields,
    required String licensePhotoPath,
  }) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrlForKyc}${ApiConstants.saveKycLicenseEndpoint}',
    );

    final request = http.MultipartRequest('PUT', url);

    request.headers.addAll(_authHeaders);
    request.fields.addAll(textFields);
    request.files.add(
      await http.MultipartFile.fromPath(
        'photo',
        licensePhotoPath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? "Failed to Upload");
    }
  }

  //SAVE VEHICLE STEP
  Future<Map<String, dynamic>> saveVehicle({
    required Map<String, String> textFields,
    required String vehiclePhotoPath,
    required String bluebookPhotoPath,
  }) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrlForKyc}${ApiConstants.saveKycVehicleEndpoint}',
    );

    final request = http.MultipartRequest('PUT', url);

    request.headers.addAll(_authHeaders);
    request.fields.addAll(textFields);
    request.files.add(
      await http.MultipartFile.fromPath(
        'vehiclePhoto',
        vehiclePhotoPath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
        'bluebookPhoto',
        bluebookPhotoPath,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? "Failed to Upload");
    }
  }

  Future<Map<String, dynamic>> submitKyc() async {
    final url = Uri.parse(
      '${ApiConstants.baseUrlForKyc}${ApiConstants.submitKyc}',
    );

    final request = await http.post(url, headers: _authHeaders);
    final data = jsonDecode(request.body);

    if (request.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? "Failed to Upload");
    }
  }
}
