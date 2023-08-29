// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videochat_app/resources/auth_methods.dart';
import 'package:videochat_app/widgets/custombutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods(); 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Start or join a meeting",
                  style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.03),
                  child: Image.asset("assets/images/onboarding.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: CustomButton(
                    text: "Login",
                    onPressed: () async {
                      bool res = await _authMethods.signInWithGoogle(context);
                      if (res) {
                        Navigator.pushNamed(context, "/home_screen");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
