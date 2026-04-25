import 'package:flutter/material.dart';
import 'package:yatritech/screens/user/KYC/kyc_view.dart';

class ProfileSidebarScreen extends StatefulWidget {
  const ProfileSidebarScreen({super.key});

  @override
  State<ProfileSidebarScreen> createState() => _ProfileSidebarScreenState();
}

class _ProfileSidebarScreenState extends State<ProfileSidebarScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.shrink(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(35, 0, 0, 0),
                        offset: Offset(0, 10),
                        spreadRadius: -3,
                        blurRadius: 15,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(35, 0, 0, 0),
                        offset: Offset(0, 4),
                        spreadRadius: -4,
                        blurRadius: 6,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Color(0xff343A40), size: 20),
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60.9,
                        height: 60.9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff4DA8DA), Color(0xff73C2FB)],
                          ),
                          border: Border.all(
                            color: Color(0xFFFFFFFF).withOpacity(0.5),
                            width: 1.54,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: Offset(0, 2),
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Image.network(
                                "https://picsum.photos/240",

                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff51CF66),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back,",
                            style: TextStyle(color: Color(0xff6C757D)),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Pujan Dhakal",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff343A40),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Safe Driver • 87 Score",
                            style: TextStyle(
                              color: Color(0xff4DA8DA),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffBBE8BE)),
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffE9F2E3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: Color(0xff51CF66),
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "All Systems Secure",
                          style: TextStyle(
                            color: Color(0xff2F9E44),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KycView()),
                    ),
                    child: Text("Verify KYC"),
                  ),

                  SizedBox(height: 22),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset(0, 8),
                          blurRadius: 32,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.directions_car_outlined,
                                      size: 24,
                                      color: Color(0xff4DA8DA),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Honda Civic",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff343A40),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "DL 01 AB 1234",
                                  style: TextStyle(color: Color(0xff6C757D)),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(color: Color(0xffBEECC4)),
                                color: Color(0xffEDF8EC),
                              ),
                              child: Text(
                                "Secure",
                                style: TextStyle(
                                  color: Color(0xff2F9E44),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            upper_container_row(
                              iconName: Icon(
                                Icons.battery_0_bar,
                                size: 20,
                                color: Color(0xff4DA8DA),
                              ),
                              text: "Battery",
                              desc: "87%",
                            ),
                            upper_container_row(
                              iconName: Icon(
                                Icons.shield_outlined,
                                size: 20,
                                color: Color(0xff6ACFCF),
                              ),
                              text: "Protection",
                              desc: "Active",
                            ),
                            upper_container_row(
                              iconName: Icon(
                                Icons.location_on_outlined,
                                size: 20,
                                color: Color(0xffFFB547),
                              ),
                              text: "Location",
                              desc: "Tracked",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset(0, 8),
                          blurRadius: 32,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(50, 77, 168, 218),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Color.fromARGB(50, 77, 168, 218),
                                ),
                              ),
                              child: Icon(
                                Icons.trending_up,
                                size: 24,
                                color: Color(0xff4DA8DA),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today's Travel",
                                  style: TextStyle(color: Color(0xff6C757D)),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "42.3",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff343A40),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Text(
                              "Duration",
                              style: TextStyle(color: Color(0xff6C757D)),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "1h 23m",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff343A40),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset(0, 8),
                          blurRadius: 32,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        //Icon
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffECF4F8),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Color.fromARGB(50, 77, 168, 218),
                            ),
                          ),
                          child: Icon(
                            Icons.bolt_outlined,
                            color: Color(0xff4DA8DA),
                            size: 24,
                          ),
                        ),

                        SizedBox(width: 12),
                        //header and body
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Crash Detection Active",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Emergency services will be notified automatically if an impact is detected.",

                                style: TextStyle(
                                  color: Color(0xff6C757D),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Quick Actions",
                    style: TextStyle(fontSize: 16, color: Color(0xff343A40)),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),

                            gradient: LinearGradient(
                              colors: [Color(0xff4DA8DA), Color(0xff73C2FB)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 24,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Start Journey",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [Color(0xff6ACFCF), Color(0xff51CF66)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.shield_outlined,
                                size: 24,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Lock Vehicle",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column upper_container_row({
    required Icon iconName,
    required String text,
    required String desc,
  }) {
    return Column(
      children: [
        iconName,

        SizedBox(height: 4),
        Text(text, style: TextStyle(fontSize: 12, color: Color(0xff6C757D))),
        SizedBox(height: 8),
        Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff343A40),
          ),
        ),
      ],
    );
  }
}
