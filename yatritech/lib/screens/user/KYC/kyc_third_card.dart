import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KycThirdCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const KycThirdCard({super.key, required this.formKey});

  @override
  State<KycThirdCard> createState() => _KycThirdCardState();
}

class _KycThirdCardState extends State<KycThirdCard> {
  final _licenseNumberController = TextEditingController();
  final _issuedDateController = TextEditingController();
  final _placeOfIssueController = TextEditingController();

  String? _validateLicense(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter license no.";
    }
    return null;
  }

  String? _validateDateOfIssue(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter date of issue";
    }
    return null;
  }

  String? _validatePlaceOfIssue(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter place of issue";
    }
    return null;
  }

  @override
  void dispose() {
    _licenseNumberController.dispose();
    _issuedDateController.dispose();
    _placeOfIssueController.dispose();
    super.dispose();
  }

  //Image Picker Logic
  File? _licensePhoto;
  final _picker = ImagePicker();

  pickLicensePhoto() async {
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
          _licensePhoto = file;
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
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "License No.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              //License Number
              TextFormField(
                controller: _licenseNumberController,
                validator: _validateLicense,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Your License No.",

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
                controller: _issuedDateController,
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
                      _issuedDateController.text = formattedDate;
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

              //Upload your License
              Text(
                "License Photo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              FormField<File>(
                validator: (value) {
                  if (_licensePhoto == null) {
                    return "Please Upload your license photo";
                  }
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await pickLicensePhoto();
                          formFieldState.didChange(_licensePhoto);
                          if (_licensePhoto != null) {
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
                          child: _licensePhoto == null
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
                              : Image.file(_licensePhoto!),
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
            ],
          ),
        ),
      ),
    );
  }
}
