import 'package:ac_material_app/screens/bottom_bar.dart';
import 'package:ac_material_app/screens/home_screen.dart';
import 'package:ac_material_app/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashForLoggedIn extends StatefulWidget {
  const SplashForLoggedIn({super.key});

  @override
  State<SplashForLoggedIn> createState() => _SplashForLoggedInState();
}

class _SplashForLoggedInState extends State<SplashForLoggedIn> {
  void initState() {
    super.initState();
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) =>  LoginScreen()),
              (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/Onboarding.png",
                fit: BoxFit.fill,
              ),
            ),
             Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AC|MATERIAL",
                      style: TextStyle(
                        color: Color(0xff4178F3),
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "Welcome to AC Material mobile app for 2026 class ",
                      style: TextStyle(
                        color: Color(0xff030303),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
