import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, appBar: AppBar());
  }
}
