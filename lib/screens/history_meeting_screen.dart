// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:videochat_app/resources/firestore_methods.dart';
import 'package:videochat_app/utils/colors.dart';

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().meetingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                "Room Name : ${(snapshot.data! as dynamic).docs[index]['meetingName']}",
                style: GoogleFonts.poppins(color: textcolor),
              ),
              subtitle: Text(
                  "Joined on : ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]["createdAt"].toDate())}",
                  style: GoogleFonts.poppins(color: textcolor)),
            ),
          );
        });
  }
}
