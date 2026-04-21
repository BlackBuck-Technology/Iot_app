import 'package:flutter/material.dart';

class KycFourthCard extends StatefulWidget {
  const KycFourthCard({super.key});

  @override
  State<KycFourthCard> createState() => _KycFourthCardState();
}

class _KycFourthCardState extends State<KycFourthCard> {
  final TextEditingController _issuedDateController = TextEditingController();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Registration No.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),

            //Registration Number
            TextField(
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
              ),
            ),

            SizedBox(height: 20),

            //Date of Registration
            Text(
              "Date of Registration",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),

            TextField(
              controller: _issuedDateController,
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
            TextField(
              keyboardType: TextInputType.number,
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
            TextField(
              keyboardType: TextInputType.number,
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
              ),
            ),

            SizedBox(height: 20),

            //Upload your Citizenship
            Text(
              "Vehicle Photo",
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
            //Upload your Citizenship
            Text(
              "Bluebook Photo",
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
    );
  }
}
