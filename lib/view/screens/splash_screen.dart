import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waiter/view/screens/login_screen.dart';
import 'package:waiter/view/dashboard_screen.dart';
import '../../utils/sharedPreference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkLogin() async {
    bool isLoggedIn = await SharedPref.getLogin();
    String token = await SharedPref.getString(PrefKeys.userToken);

    if (token.isNotEmpty && isLoggedIn) {
      Get.offAll(() => DashboardScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), checkLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/splash_top.png',
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/splash_logo.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/splash_bottom.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
