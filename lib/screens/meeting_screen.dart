import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:videochat_app/resources/jitsi_meet_method.dart';

import '../widgets/homewidgets.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) async {
    Navigator.pushNamed(context, '/videocall');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeWidgets(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: "New Meeting",
            ),
            HomeWidgets(
              onPressed: () => joinMeeting(context),
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
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
