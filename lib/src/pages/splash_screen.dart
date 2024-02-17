import 'dart:async';

import 'package:demo_ui/constants.dart';
import 'package:demo_ui/src/pages/home_page.dart';
import 'package:demo_ui/src/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void firstRoute()
  {
    Timer(
      const Duration(seconds: 3),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignIn()
                ,
              ),
            );
      },
    );
  }


  @override
  void initState() {
    firstRoute();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo(160, 160),
            const SizedBox(
              height: 25,
            ),
            richText(30),
          ],
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return Image.asset(
      'assets/logo.png',
      height: height_,
      width: width_,
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color:  pColor,
          letterSpacing: 3,
          height: 1.03,
        ),
        children: const [
          TextSpan(
            text: 'Tutio ',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),

        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
