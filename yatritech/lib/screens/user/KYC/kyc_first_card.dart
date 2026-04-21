import 'package:flutter/material.dart';

class KycFirstCard extends StatefulWidget {
  const KycFirstCard({super.key});

  @override
  State<KycFirstCard> createState() => _KycFirstCardState();
}

class _KycFirstCardState extends State<KycFirstCard> {
  final TextEditingController _dobController = TextEditingController();
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
              "Full Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),

            //Full Name
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Full Name",
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

            //Date of Birth
            Text(
              "Date of Birth",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),

            TextField(
              controller: _dobController,
              readOnly: true, // Prevents keyboard from appearing
              decoration: InputDecoration(
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
                    _dobController.text = formattedDate;
                  });
                }
              },
            ),

            SizedBox(height: 20),

            //Gender and nationality
            Row(
              children: [
                // Gender
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          hintText: "Select",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE5E7EB)),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff216FFE)),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        items: ['Male', 'Female', 'Other'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // state update logic later
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 16), // Sizing between the two dropdowns
                // Nationality
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nationality",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          hintText: "Select",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE5E7EB)),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff216FFE)),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        items: ['Nepali', 'Indian', 'Other'].map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // state update logic later
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Current Address
            Text(
              "Current Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                hintText: "City, Street, House No.",
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

            // Temporary Address
            // Text(
            //   "Temporary Address",
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            // ),
            // SizedBox(height: 4),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: "City, Street, House No.",
            //     hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Color(0xffE5E7EB)),
            //       borderRadius: BorderRadius.circular(14),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Color(0xff216FFE)),
            //       borderRadius: BorderRadius.circular(14),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20),

            // Mobile Number
            Text(
              "Mobile Number",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Mobile Number",
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

            //Upload your Photo
            Text(
              "Upload your Photo",
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
                        "PNG, JPG up to 5MB",
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
