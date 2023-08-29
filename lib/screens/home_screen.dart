// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videochat_app/utils/colors.dart';
import 'package:videochat_app/widgets/homewidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          backgroundColor: backgroundColor,
          title: Text("Meet & Chat"),
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.024),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeWidgets(
                  onPressed: () {},
                  icon: Icons.videocam,
                  text: "New Meeting",
                ),
                HomeWidgets(
                  onPressed: () {},
                  icon: Icons.add_box_rounded,
                  text: "Join Meeting",
                ),
                HomeWidgets(
                  onPressed: () {},
                  icon: Icons.calendar_month,
                  text: "Schedule",
                ),
                HomeWidgets(
                  onPressed: () {},
                  icon: Icons.arrow_upward,
                  text: "Share Screen",
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Create/Join meeting with just a click",
                  style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onPageChanged,
          type: BottomNavigationBarType.fixed,
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _page,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room), label: "Meet & Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Meeting"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Contacts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ],
        ),
      ),
    );
  }
}
