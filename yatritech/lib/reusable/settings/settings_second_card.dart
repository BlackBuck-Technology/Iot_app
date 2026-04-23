import 'package:flutter/material.dart';
import 'package:yatritech/screens/user/login_in_screen.dart';

class SettingsSecondCard extends StatefulWidget {
  const SettingsSecondCard({super.key});

  @override
  State<SettingsSecondCard> createState() => _SettingsSecondCardState();
}

class _SettingsSecondCardState extends State<SettingsSecondCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF).withOpacity(0.7),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: Color(0xFFFFFFFF).withOpacity(0.4),
            width: 1.18,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 32,
              offset: Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 23.992, vertical: 20),
        child: Column(
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 47.966,
                      height: 47.966,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFFFFFF).withOpacity(0.6),
                            Color(0xFFFFFFFF).withOpacity(0.3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: 23.992,
                        color: Color(0xff4DA8DA),
                      ),
                    ),
                    SizedBox(width: 11.987),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account Settings",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Color(0xff343A40),
                          ),
                        ),
                        Text(
                          "Profile & authentication",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.43,
                            color: Color(0xff6C757D),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AnimatedRotation(
                  turns: _isExpanded ? 0.25 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Icon(
                    Icons.chevron_right,
                    size: 19.99,
                    color: Color(0xff6C757D),
                  ),
                ),
              ],
            ),

            // Expandable Content
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isExpanded
                  ? Column(
                      children: [
                        SizedBox(height: 25.172),
                        Container(
                          height: 1.18,
                          color: Color(0xFFFFFFFF).withOpacity(0.4),
                        ),
                        SizedBox(height: 25.172),

                        // Profile Information
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Profile Information",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.43,
                              color: Color(0xff343A40),
                            ),
                          ),
                        ),
                        SizedBox(height: 11.987),
                        _buildProfileField(
                          icon: Icons.person_outline,
                          color: Color(0xff4DA8DA),
                          label: "Full Name",
                          value: "Pujan Dhakal",
                        ),
                        SizedBox(height: 11.987),
                        _buildProfileField(
                          icon: Icons.email_outlined,
                          color: Color(0xff6ACFCF),
                          label: "Email Address",
                          value: "dhakalpujan72@gmail.com",
                        ),
                        SizedBox(height: 11.987),
                        _buildProfileField(
                          icon: Icons.phone_outlined,
                          color: Color(0xff51CF66),
                          label: "Phone Number",
                          value: "+977 9769786820",
                        ),
                        SizedBox(height: 11.987),
                        _buildProfileField(
                          icon: Icons.calendar_today_outlined,
                          color: Color(0xffFFB547),
                          label: "Member Since",
                          value: "December 2025",
                        ),
                        SizedBox(height: 15.989),

                        // Security Divider
                        Container(
                          height: 1.18,
                          color: Color(0xFFFFFFFF).withOpacity(0.4),
                        ),
                        SizedBox(height: 17.169),

                        // Security
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Security",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.43,
                              color: Color(0xff343A40),
                            ),
                          ),
                        ),
                        SizedBox(height: 11.987),
                        _buildSecurityButton(
                          icon: Icons.lock_outline,
                          color: Color(0xff4DA8DA),
                          title: "Change Password",
                          subtitle: "Last changed 30 days ago",
                          trailing: Icon(
                            Icons.chevron_right,
                            size: 15.989,
                            color: Color(0xff6C757D),
                          ),
                        ),
                        SizedBox(height: 11.987),
                        _buildSecurityButton(
                          icon: Icons.fingerprint,
                          color: Color(0xff51CF66),
                          title: "Biometric Authentication",
                          subtitle: "Use fingerprint or Face ID",
                          trailing: Container(
                            width: 19.99,
                            height: 19.99,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff51CF66),
                            ),
                            child: Icon(
                              Icons.check,
                              size: 13.997,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 17.169),

                        // Sign Out Divider
                        Container(
                          height: 1.18,
                          color: Color(0xFFFFFFFF).withOpacity(0.4),
                        ),
                        SizedBox(height: 17.169),

                        // Sign Out Button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginInScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFF6B6B).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(0xffFF6B6B).withOpacity(0.3),
                                width: 1.18,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 17.169,
                              vertical: 17.169,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 17.999,
                                  color: Color(0xffFF6B6B),
                                ),
                                SizedBox(width: 11.987),
                                Text(
                                  "Sign Out",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    height: 1.43,
                                    color: Color(0xffFF6B6B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE9ECEF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFFFFFFFF).withOpacity(0.4),
          width: 1.18,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 17.169, vertical: 17.169),
      child: Row(
        children: [
          Container(
            width: 31.959,
            height: 31.959,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF).withOpacity(0.7),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, size: 15.989, color: color),
          ),
          SizedBox(width: 11.987),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.33,
                    color: Color(0xff6C757D),
                  ),
                ),
                SizedBox(height: 1.992),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.43,
                    color: Color(0xff343A40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityButton({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE9ECEF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFFFFFFFF).withOpacity(0.4),
          width: 1.18,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 17.169, vertical: 17.169),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 33.969,
                height: 33.969,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, size: 17.999, color: color),
              ),
              SizedBox(width: 11.987),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.43,
                      color: Color(0xff343A40),
                    ),
                  ),
                  SizedBox(height: 3.983),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.33,
                      color: Color(0xff6C757D),
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing,
        ],
      ),
    );
  }
}
