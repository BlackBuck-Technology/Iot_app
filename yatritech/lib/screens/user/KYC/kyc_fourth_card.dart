import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KycFourthCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const KycFourthCard({super.key, required this.formKey});

  @override
  State<KycFourthCard> createState() => _KycFourthCardState();
}

class _KycFourthCardState extends State<KycFourthCard> {
  final _registrationNumberController = TextEditingController();
  final _issuedDateController = TextEditingController();
  final _brandController = TextEditingController();
  final _colorController = TextEditingController();

  String? _validateRegistrationNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter registration no.";
    }
    return null;
  }

  String? _validateDateOfRegistration(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter date of registration";
    }
    return null;
  }

  String? _validateBrand(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter brand";
    }
    return null;
  }

  String? _validateColor(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter color";
    }
    return null;
  }

  //dispose method autocomplete not given befor image picker logic
  @override
  void dispose() {
    _registrationNumberController.dispose();
    _issuedDateController.dispose();
    _brandController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  //Image Picker Logic
  File? _vehiclePhoto;
  File? _bluebookPhoto;
  final _picker = ImagePicker();

  pickVehiclePhoto() async {
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
          _vehiclePhoto = file;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to pick Image')));
    }
  }

  pickBluebookPhoto() async {
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
          _bluebookPhoto = file;
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
                "Registration No.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              //Registration Number
              TextFormField(
                controller: _registrationNumberController,
                validator: _validateRegistrationNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Your Registration No.",

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

              //Date of Registration
              Text(
                "Date of Registration",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              TextFormField(
                controller: _issuedDateController,
                validator: _validateDateOfRegistration,
                readOnly: true, // Prevents keyboard from appearing
                decoration: InputDecoration(
                  hintText: "Select Registration Date",
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
                "Brand",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              //Brand
              TextFormField(
                controller: _brandController,
                validator: _validateBrand,
                decoration: InputDecoration(
                  hintText: "Enter Vehicle Brand",

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

              //Color
              Text(
                "Color",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 4),

              //Brand
              TextFormField(
                controller: _colorController,
                validator: _validateColor,
                decoration: InputDecoration(
                  hintText: "Enter Vehicle Color",

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

              //Upload your Vehicle Photo
              Text(
                "Vehicle Photo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              FormField<File>(
                validator: (value) {
                  if (_vehiclePhoto == null) {
                    return "Please Upload your vehicle photo";
                  }
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await pickVehiclePhoto();
                          formFieldState.didChange(_vehiclePhoto);
                          if (_vehiclePhoto != null) {
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
                          child: _vehiclePhoto == null
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
                              : Image.file(_vehiclePhoto!),
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
              //Upload your Citizenship
              Text(
                "Bluebook Photo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              FormField<File>(
                validator: (value) {
                  if (_vehiclePhoto == null) {
                    return "Please Upload your bluebook photo";
                  }
                  return null;
                },
                builder: (formFieldState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await pickBluebookPhoto();
                          formFieldState.didChange(_bluebookPhoto);
                          if (_bluebookPhoto != null) {
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
                          child: _bluebookPhoto == null
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
                              : Image.file(_bluebookPhoto!),
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
