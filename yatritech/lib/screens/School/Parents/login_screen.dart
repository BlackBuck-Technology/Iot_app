import 'package:flutter/material.dart';
import 'package:yatritech/screens/School/Parents/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();

  bool _otpSent = false;
  bool _isLoading = false;

  void _sendOTP() {
    if (_phoneController.text.length < 10) return;

    setState(() {
      _isLoading = true;
    });

    //mock api call for sending otp
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _otpSent = true;
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("OTP sent successfully!")));
    });
  }

  void _verifyOTPAndLogin() {
    if (_otpController.text.length < 4) return;

    setState(() {
      _isLoading = true;
    });

    //Mock API call for verifying OTP
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      //Navigate to Parent Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  void _loginWithGoogle() {
    //Mock Google Login
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Google Login initiated...")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, appBar: AppBar());
  }
}
