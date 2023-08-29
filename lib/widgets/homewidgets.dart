import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videochat_app/utils/colors.dart';

class HomeWidgets extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeWidgets(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.17,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: Offset(0, 4))
              ],
            ),
            child: Icon(
              widget.icon,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.text,
            style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.height * 0.014,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
