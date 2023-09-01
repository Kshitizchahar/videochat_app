// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:videochat_app/resources/auth_methods.dart';
import 'package:videochat_app/resources/jitsi_meet_method.dart';
import 'package:videochat_app/utils/colors.dart';
import 'package:videochat_app/widgets/custombutton.dart';
import 'package:videochat_app/widgets/meeingoption.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethod.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text("Join a Meeting"),
        titleTextStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.height * 0.024),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              style: GoogleFonts.poppins(color: Colors.black),
              cursorColor: Colors.black,
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter Room ID"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            TextField(
              style: GoogleFonts.poppins(
                color: Colors.black,
              ),
              cursorColor: Colors.black,
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Name"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomButton(text: "Join Meeting", onPressed: _joinMeeting),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            MeetingOption(
              text: "Don't join with the Audio",
              isMute: isAudioMuted,
              onChanged: onAudioMuted,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            MeetingOption(
              text: "Don't join with the Video",
              isMute: isVideoMuted,
              onChanged: onVideoMuted,
            )
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(
      () {
        isAudioMuted = val;
      },
    );
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
