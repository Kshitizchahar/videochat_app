// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 10,
          side: BorderSide(color: Colors.black),
          minimumSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.06),
          backgroundColor: buttonColor),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.height * 0.022,
            color: Colors.black,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
