// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videochat_app/resources/auth_methods.dart';
import 'package:videochat_app/screens/history_meeting_screen.dart';
import 'package:videochat_app/screens/meeting_screen.dart';
import 'package:videochat_app/utils/colors.dart';
import 'package:videochat_app/widgets/custombutton.dart';

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

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeeting(),
    Center(child: Image.asset("assets/images/con1.jpg")),
    Padding(
      padding: EdgeInsets.all(15),
      child: CustomButton(
          text: "Log out", onPressed: () => AuthMethods().signOut()),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          backgroundColor: backgroundColor,
          title:
              Text("Meet & Chat", style: GoogleFonts.poppins(color: textcolor)),
          titleTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.024),
          centerTitle: true,
          elevation: 0,
        ),
        body: pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onPageChanged,
          type: BottomNavigationBarType.fixed,
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: _page,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.meeting_room,
              ),
              label: "Meet & Chat",
            ),
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
