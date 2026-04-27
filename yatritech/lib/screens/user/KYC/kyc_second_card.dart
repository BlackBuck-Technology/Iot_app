import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yatritech/services/kyc_service.dart';
import 'package:yatritech/utils/token_util.dart';

class KycSecondCard extends StatefulWidget {
  const KycSecondCard({super.key});

  @override
  State<KycSecondCard> createState() => KycSecondCardState();
}

class KycSecondCardState extends State<KycSecondCard> {
  final _citizenshipNumberController = TextEditingController();
  final _dateOfIssueController = TextEditingController();
  final _placeOfIssueController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //Connecting to server --->
  Future<bool> handleCitizenshipStep() async {
    if (_formKey.currentState!.validate()) {
      String? _token = await TokenUtil.getToken();
      if (_token == null) return false;

      final _kycService = KycService(token: _token);
      try {
        final request = await _kycService.saveCitizenship(
          textFields: {
            'citizenshipNumber': _citizenshipNumberController.text,
            'dateOfIssue': _dateOfIssueController.text,
            'placeOfIssue': _placeOfIssueController.text,
          },
          frontPhotoPath: _frontPhoto!.path,
          backPhotoPath: _backPhoto!.path,
        );
        return true;
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$e')));
        return false;
      }
    }
    return false;
  }

  // <---

  String? _validateCitizenship(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your citizenship no.";
    }
    return null;
  }

  String? _validateDateOfIssue(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the date of issue";
    }
    return null;
  }

  String? _validatePlaceOfIssue(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the place of issue";
    }
    return null;
  }

  @override
  void dispose() {
    _citizenshipNumberController.dispose();
    _dateOfIssueController.dispose();
    _placeOfIssueController.dispose();
    super.dispose();
  }

  //Image Picker Logic
  File? _frontPhoto;
  File? _backPhoto;
  final _picker = ImagePicker();

  pickFrontPhoto() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // Compress the image quality to help stay under 1MB
      );

      if (pickedImage != null) {
        final File file = File(pickedImage.path);

        // Optional: Check exactly if it is under 1MB (1,048,576 bytes)
        int sizeInBytes = file.lengthSync();
        if (sizeInBytes > 1048576) {
          // Show error to user using SnackBar
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image must be under 1MB')),
            );
          }
          return;
        }

        setState(() {
          _frontPhoto = file;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to pick Image')));
    }
  }

  pickBackPhoto() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // Compress the image quality to help stay under 1MB
      );

      if (pickedImage != null) {
        final File file = File(pickedImage.path);

        // Optional: Check exactly if it is under 1MB (1,048,576 bytes)
        int sizeInBytes = file.lengthSync();
        if (sizeInBytes > 1048576) {
          // Show error to user using SnackBar
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image must be under 1MB')),
            );
          }
          return;
        }

        setState(() {
          _backPhoto = file;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to pick Image')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Citizenship No.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              //Citizenship Number
              TextFormField(
                controller: _citizenshipNumberController,
                keyboardType: TextInputType.number,
                validator: _validateCitizenship,
                decoration: InputDecoration(
                  hintText: "Enter Your Citizenship No.",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE5E7EB)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff216FFE)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //Date of Issue
              Text(
                "Date of Issue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              TextFormField(
                controller: _dateOfIssueController,
                validator: _validateDateOfIssue,
                readOnly: true, // Prevents keyboard from appearing
                decoration: InputDecoration(
                  hintText: "Select Issued Date",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  suffixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE5E7EB)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff216FFE)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().subtract(
                      Duration(days: 365 * 18),
                    ), // Default to 18 years ago
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    String formattedDate = pickedDate.toString().split(' ')[0];

                    setState(() {
                      _dateOfIssueController.text = formattedDate;
                    });
                  }
                },
              ),

              SizedBox(height: 20),
              Text(
                "Place of Issue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              //Place of issue
              TextFormField(
                controller: _placeOfIssueController,
                validator: _validatePlaceOfIssue,
                decoration: InputDecoration(
                  hintText: "Enter Your District",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE5E7EB)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff216FFE)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 1),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //Upload your Citizenship
              Text(
                "Citizenship Photo(Front)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              FormField<File>(
                validator: (value) {
                  if (_frontPhoto == null) {
                    return "Please Upload front photo of citizenship";
                  }
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await pickFrontPhoto();

                          formFieldState.didChange(_frontPhoto);

                          if (_frontPhoto != null) {
                            formFieldState.validate();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 32,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white, // Light cyan/mint background
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: formFieldState.hasError
                                  ? Colors.red.shade700
                                  : Color(0xff216FFE), // Teal border color
                              width: 1.5,
                            ),
                          ),
                          child: _frontPhoto == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Circular Upload Icon with Shadow
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.08,
                                            ),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.upload_rounded,
                                        color: Color(
                                          0xff216FFE,
                                        ), // Matching teal color
                                        size: 32,
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    // Main Title
                                    Text(
                                      "Click to upload or drag and drop",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(
                                          0xff334155,
                                        ), // Dark slate-blue text
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 12),

                                    // Small info pill
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "PNG, JPG up to 1MB",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Image.file(_frontPhoto!),
                        ),
                      ),
                      if (formFieldState.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 12),
                          child: Text(
                            formFieldState.errorText!,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),

              //Upload your Photo
              Text(
                "Citizenship Photo(Back)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              FormField<File>(
                validator: (value) {
                  if (_backPhoto == null) {
                    return "Please Upload back photo of citizenship";
                  }
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await pickBackPhoto();
                          formFieldState.didChange(_backPhoto);
                          if (_backPhoto != null) {
                            formFieldState.validate();
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 32,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white, // Light cyan/mint background
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: formFieldState.hasError
                                  ? Colors.red.shade700
                                  : Color(0xff216FFE), // Teal border color
                              width: 1.5,
                            ),
                          ),
                          child: _backPhoto == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Circular Upload Icon with Shadow
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.08,
                                            ),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.upload_rounded,
                                        color: Color(
                                          0xff216FFE,
                                        ), // Matching teal color
                                        size: 32,
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    // Main Title
                                    Text(
                                      "Click to upload or drag and drop",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(
                                          0xff334155,
                                        ), // Dark slate-blue text
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 12),

                                    // Small info pill
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "PNG, JPG up to 1MB",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Image.file(_backPhoto!),
                        ),
                      ),

                      if (formFieldState.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 12),
                          child: Text(
                            formFieldState.errorText!,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
