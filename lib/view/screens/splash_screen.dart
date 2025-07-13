import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyekt/view/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF112095), Color(0xFF092052)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            SvgPicture.asset(
              "assets/svgs/splashImage1.svg",
              color: Color(0xFF65D6FC),
            ),
            SvgPicture.asset(
              "assets/svgs/splashImage2.svg",
              color: Color(0xFF65D6FC),
            ),
            Spacer(),
            SvgPicture.asset(
              "assets/svgs/splashImage3.svg",
              color: Color(0xFF00133F),
            ),
          ],
        ),
      ),
    );
  }
}
