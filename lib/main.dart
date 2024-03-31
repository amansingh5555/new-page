import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mess/page/signup.dart';
import 'package:mess/page/user.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF21899C),
        body: SafeArea(
          child: SignInPage(),
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -34,
            top: 181.0,
            child: SvgPicture.string(
              // Left side background SVG string
              '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 99.0,
              height: 99.0,
            ),
          ),
          Positioned(
            right: -52,
            top: 45.0,
            child: SvgPicture.string(
              // Right side background SVG string
              '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 139.0,
              height: 139.0,
            ),
          ),
          Positioned(
            top: 8.0,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: SignInFive(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInFive extends StatefulWidget {
  const SignInFive({Key? key}) : super(key: key);

  @override
  State<SignInFive> createState() => _SignInFiveState();
}

class _SignInFiveState extends State<SignInFive> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo section
        Column(
          children: [
            SvgPicture.asset(
              'assets/logo2.svg',
              height: size.height / 8,
              width: size.height / 8,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'मा खोदियार मेसवर स्वागत आहे',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 2),
                  ),
                ],
                fontFeatures: [
                  FontFeature.enable('smcp'), // Small caps
                ],
              ),
            ),
          ],
        ),
        // Phone number and password text fields
        SizedBox(
          height: size.height / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'फोन नंबर',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.ltr, // For Marathi text
                keyboardType: TextInputType.phone, // For phone number input
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'पासवर्ड',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        // Sign In button
        SizedBox(
          width: size.width,
          height: size.height / 15,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
            },
            child: Text(
              'साइन इन करा',
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF23A0C9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        // Sign Up link
        SizedBox(
          height: size.height / 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "खातेची नसल्यास?",
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
            SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text(
                'साइन अप करा',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}
