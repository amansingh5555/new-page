import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import DateFormat

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _collegeDetailsController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _dateOfJoiningController = TextEditingController(); // Add date of joining controller
  bool _isOTPVisible = false;
  String _currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now()); // Get current date

  @override
  void initState() {
    super.initState();
    _dateOfJoiningController.text = _currentDate; // Set current date in the date field
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF21899C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
                SizedBox(height: 32),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'नाव',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'फोन नंबर',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: 'पत्ता',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _collegeDetailsController,
                  decoration: InputDecoration(
                    hintText: 'कॉलेजचे तपशील',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Date of Joining: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _dateOfJoiningController,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: 'तारीख योग्यता',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                          ),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _isOTPVisible
                    ? Column(
                  children: [
                    TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'OTP',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16),
                  ],
                )
                    : SizedBox(),
                SizedBox(
                  width: size.width,
                  height: size.height / 15,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_isOTPVisible) {
                        // Request OTP
                        // You can replace this with your OTP sending logic
                        setState(() {
                          _isOTPVisible = true;
                        });
                      } else {
                        // Verify OTP
                        // You can replace this with your OTP verification logic
                        // After successful verification, proceed with sign-up
                      }
                    },
                    child: Text(
                      _isOTPVisible ? 'आपण कोड खात्री करा' : 'OTP पाठवा',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF23A0C9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigate back to sign-in page
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _collegeDetailsController.dispose();
    _otpController.dispose();
    _dateOfJoiningController.dispose(); // Dispose the date of joining controller
    super.dispose();
  }
}
