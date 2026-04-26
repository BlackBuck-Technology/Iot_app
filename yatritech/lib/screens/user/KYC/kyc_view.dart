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

  //Form Key
  final _firstCardFormKey = GlobalKey<FormState>();
  final _secondCardFormKey = GlobalKey<FormState>();
  final _thirdCardFormKey = GlobalKey<FormState>();
  final _fourthCardFormKey = GlobalKey<FormState>();

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
                  onPressed: () {
                    if (_currentStep > 0) {
                      _kycPageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
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
                        child: GestureDetector(
                          onTap: () {
                            if (index < _currentStep) {
                              _kycPageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: _buildStepIndicator(
                            title: _steps[index],
                            isActive: index <= _currentStep,
                          ),
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
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                children: [
                  KycFirstCard(formKey: _firstCardFormKey),
                  KycSecondCard(formKey: _secondCardFormKey),
                  KycThirdCard(formKey: _thirdCardFormKey,),
                  KycFourthCard(formKey: _fourthCardFormKey,),
                ],
              ),
            ),

            //Next and Submit button
            GestureDetector(
              onTap: () {
                if (_currentStep == 0) {
                  if (_firstCardFormKey.currentState!.validate()) {
                    openKycNextPage();
                  }
                } else if (_currentStep == 1) {
                  if (_secondCardFormKey.currentState!.validate()) {
                    openKycNextPage();
                  }
                } else if (_currentStep == 2) {
                  if (_thirdCardFormKey.currentState!.validate()) {
                    openKycNextPage();
                  }
                } else {
                  if (_fourthCardFormKey.currentState!.validate()) {}
                }
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

  Widget _buildStepIndicator({required String title, required bool isActive}) {
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
