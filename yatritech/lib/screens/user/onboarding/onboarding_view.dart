import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yatritech/screens/user/login_in_screen.dart';
import 'package:yatritech/screens/user/onboarding/onboarding_screen.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void openNextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            //Sliding content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  OnboardingScreen(
                    imgSrc: "assets/onboarding/rafiki.svg",
                    title: "Protect Your Ride",
                    desc:
                        "Real-time tracking and instant alerts if your vehicle moves unexpectedly.",
                  ),
                  OnboardingScreen(
                    imgSrc: "assets/onboarding/bro.svg",
                    title: "Stay Safe on the Road",
                    desc:
                        "Automatic crash detection with emergency alerts and location sharing.",
                  ),
                  OnboardingScreen(
                    imgSrc: "assets/onboarding/onboardin_third.svg",
                    title: "Drive Smarter",
                    desc:
                        "Track your driving behavior and get a personalized safety score.",
                  ),
                ],
              ),
            ),

            //Fixed Button and Pagination
            Column(
              children: [
                //pagination
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Colors.black,
                    dotWidth: 8,
                    dotHeight: 8,
                  ),
                ),

                SizedBox(height: 24),

                //next button
                GestureDetector(
                  onTap: () {
                    if (_pageController.page?.round() == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginInScreen(),
                        ),
                      );
                    } else {
                      openNextPage();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _currentPage == 2
                            ? Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            : Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),

                AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _currentPage == 2
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),

                SizedBox(height: 48),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
