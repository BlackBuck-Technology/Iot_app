import 'package:flutter/material.dart';

class KycSecondCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const KycSecondCard({super.key, required this.formKey});

  @override
  State<KycSecondCard> createState() => _KycSecondCardState();
}

class _KycSecondCardState extends State<KycSecondCard> {
  final _citizenshipNumberController = TextEditingController();
  final _dateOfIssueController = TextEditingController();
  final _placeOfIssueController = TextEditingController();

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
              GestureDetector(
                onTap: () {
                  // TODO: Implement file picking logic here
                  print("Open gallery or camera");
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white, // Light cyan/mint background
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xff216FFE), // Teal border color
                      width: 1.5,
                    ),
                  ),
                  child: Column(
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
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.upload_rounded,
                          color: Color(0xff216FFE), // Matching teal color
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
                          color: Color(0xff334155), // Dark slate-blue text
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
                  ),
                ),
              ),
              SizedBox(height: 20),

              //Upload your Photo
              Text(
                "Citizenship Photo(Back)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  // TODO: Implement file picking logic here
                  print("Open gallery or camera");
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white, // Light cyan/mint background
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xff216FFE), // Teal border color
                      width: 1.5,
                    ),
                  ),
                  child: Column(
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
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.upload_rounded,
                          color: Color(0xff216FFE), // Matching teal color
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
                          color: Color(0xff334155), // Dark slate-blue text
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
