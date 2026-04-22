import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:yatritech/screens/user/KYC/kyc_first_card.dart';
import 'package:yatritech/screens/user/KYC/kyc_fourth_card.dart';
import 'package:yatritech/screens/user/KYC/kyc_second_card.dart';
import 'package:yatritech/screens/user/KYC/kyc_third_card.dart';

class KycView extends StatefulWidget {
  const KycView({super.key});

  @override
  State<KycView> createState() => _KycViewState();
}

class _KycViewState extends State<KycView> {
  //pagination
  int _currentStep = 0;
  final List<String> _steps = ['Personal', 'Citizenship', 'License', 'Vehicle'];

  //page view controller
  final PageController _kycPageController = PageController();

  @override
  void dispose() {
    _kycPageController.dispose();
    super.dispose();
  }

  void openKycNextPage() {
    _kycPageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //back button
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.chevron_left),
                ),
                SizedBox.shrink(),
              ],
            ),

            //Top part
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify KYC",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: List.generate(_steps.length, (index) {
                      return Expanded(
                        child: _buildStepIndicator(
                          title: _steps[index],
                          isActive: index <= _currentStep,
                          isLast: index == _steps.length - 1,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            //card
            Expanded(
              child: PageView(
                controller: _kycPageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                children: [
                  KycFirstCard(),
                  KycSecondCard(),
                  KycThirdCard(),
                  KycFourthCard(),
                ],
              ),
            ),

            //Next and Submit button
            GestureDetector(
              onTap: () {
                openKycNextPage();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xff216FFE),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _currentStep == 3
                        ? Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        : Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator({
    required String title,
    required bool isActive,
    required bool isLast,
  }) {
    final color = isActive ? Color(0xff155DFC) : Colors.grey.shade400;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: color)),
          SizedBox(height: 8),
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
