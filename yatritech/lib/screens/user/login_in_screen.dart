import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yatritech/screens/user/Forgot_Password/forgot_pass_first_page.dart';
import 'package:yatritech/screens/user/KYC/kyc_view.dart';
import 'package:yatritech/screens/user/bottom_nav.dart';
import 'package:yatritech/screens/user/register_screen.dart';
import 'package:yatritech/services/auth_service.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool rememberMe = false;
  bool _obscurePassword = true;

  //Connecting to server

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await _authService.signinUser(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNav()),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      } finally {
        if (mounted)
          setState(() {
            _isLoading = false;
          });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Email regex pattern
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.7,
                    child: SvgPicture.asset('assets/YatriConnectLogo.svg'),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Yatri",
                      style: GoogleFonts.varelaRound(
                        fontSize: 45,
                        color: Color(0xff1E5FA1),
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: "Tech",
                          style: TextStyle(color: Color(0xff2FB8C8)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff343A40),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // SizedBox(height: 20),
                  // Text(
                  //   "Sign in to your safety platform",
                  //   style: TextStyle(fontSize: 16, color: Color(0xff6C757D)),
                  // ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(25, 0, 0, 0),
                          offset: Offset(0, 8),
                          blurRadius: 32,
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(25, 0, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email Address",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff343A40),
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: _validateEmail,
                            decoration: InputDecoration(
                              hintText: "dhakalpujan72@gmail.com",
                              hintStyle: TextStyle(
                                color: Color(0xffADB5BD),
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 20,
                                color: Color(0xff6C757D),
                              ),
                              filled: true,
                              fillColor: Color(0xffE9ECEF).withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          Text(
                            "Password",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff343A40),
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            validator: _validatePassword,
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: TextStyle(
                                color: Color(0xffADB5BD),
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                size: 20,
                                color: Color(0xff6C757D),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 20,
                                  color: Color(0xff6C757D),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Color(0xffE9ECEF).withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    rememberMe = !rememberMe;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Color(
                                          0xffE9ECEF,
                                        ).withOpacity(0.5),
                                        border: Border.all(
                                          color: Color(0xffADB5BD),
                                          width: 1.18,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: rememberMe
                                          ? Icon(
                                              Icons.check,
                                              size: 14,
                                              color: Color(0xff343A40),
                                            )
                                          : null,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff343A40),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPassFirstPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4DA8DA),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xff4DA8DA), Color(0xff73C2FB)],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff4DA8DA).withOpacity(0.3),
                                  offset: Offset(0, 10),
                                  blurRadius: 15,
                                  spreadRadius: -3,
                                ),
                                BoxShadow(
                                  color: Color(0xff4DA8DA).withOpacity(0.3),
                                  offset: Offset(0, 4),
                                  blurRadius: 6,
                                  spreadRadius: -4,
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: _handleSignIn,
                               
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sign In",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.chevron_right,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff6C757D),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign up",
                                      style: TextStyle(
                                        color: Color(0xff4DA8DA),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Stack(
                          //   alignment: Alignment.center,
                          //   children: [
                          //     Divider(color: Color(0xffDEE2E6), thickness: 1.18),
                          //     Container(
                          //       padding: EdgeInsets.symmetric(
                          //         horizontal: 16,
                          //         vertical: 4,
                          //       ),
                          //       decoration: BoxDecoration(
                          //         color: Colors.white.withOpacity(0.8),
                          //         borderRadius: BorderRadius.circular(16),
                          //       ),
                          //       child: Text(
                          //         "Or continue with",
                          //         style: TextStyle(
                          //           fontSize: 12,
                          //           color: Color(0xff6C757D),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 20),

                          // Container(
                          //   width: double.infinity,
                          //   height: 56,
                          //   decoration: BoxDecoration(
                          //     color: Color(0xffE9ECEF).withOpacity(0.5),
                          //     border: Border.all(
                          //       color: Colors.white.withOpacity(0.4),
                          //       width: 1.18,
                          //     ),
                          //     borderRadius: BorderRadius.circular(16),
                          //   ),
                          //   child: Material(
                          //     color: Colors.transparent,
                          //     child: InkWell(
                          //       borderRadius: BorderRadius.circular(16),
                          //       onTap: () {
                          //         // Face ID / Touch ID action
                          //       },
                          //       child: Center(
                          //         child: Text(
                          //           "🔐 Face ID / Touch ID",
                          //           style: TextStyle(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.bold,
                          //             color: Color(0xff343A40),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 22),
                ],
              ),
            ),
    );
  }
}
