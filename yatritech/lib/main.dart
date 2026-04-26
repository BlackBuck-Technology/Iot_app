import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:yatritech/common/globs.dart';
import 'package:yatritech/common/location_manager.dart';
import 'package:yatritech/common/my_http_overrides.dart';
import 'package:yatritech/common/service_call.dart';
import 'package:yatritech/common/socket_manager.dart';
import 'package:yatritech/screens/user/onboarding/onboarding_view.dart';

SharedPreferences? prefs;

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  ServiceCall.userUUID = Globs.udValueString("uuid");

  if (ServiceCall.userUUID == "") {
    ServiceCall.userUUID = const Uuid().v6();
    Globs.udStringSet(ServiceCall.userUUID, "uuid");
  }

  SocketManager.shared.initSocket();
  LocationManager.shared.initLocation();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yatriTECH',
      theme: ThemeData(textTheme: GoogleFonts.varelaRoundTextTheme()),
      debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}
