import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/screens/profile_screen.dart';
import 'package:barbershop_app/screens/notification_screen.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: appBar,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Text(
      'BARBERSHOP',
      style: GoogleFonts.dancingScript(
        fontSize: 18
      ),
    ),
    actions: [
      Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            ),
            child: const Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: yellow,
              ),
              child: const Text(
                '4',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 10, right: 20),
          child: CircleAvatar(
            backgroundColor: gray,
            child: Icon(
              Icons.person,
              color: text,
              size: 30,
            ),
          ),
        ),
      )
    ],
  );
}