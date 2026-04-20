import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  final String imgSrc;
  final String title;
  final String desc;

  const OnboardingScreen({
    super.key,
    required this.imgSrc,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Top middle part
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imgSrc),
            SizedBox(height: 38),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            Text(
              textAlign: TextAlign.center,
              desc,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff6E6E6E),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
