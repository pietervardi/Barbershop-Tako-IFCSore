import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/screens/profile_screen.dart';
import 'package:barbershop_app/screens/notification_screen.dart';

class ExtraServiceScreen extends StatefulWidget {
  const ExtraServiceScreen({Key? key}) : super(key: key);

  @override
  State<ExtraServiceScreen> createState() => _ExtraServiceScreenState();
}

class _ExtraServiceScreenState extends State<ExtraServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBar,
        automaticallyImplyLeading: false,
        title: const Text(
          'BARBERSHOP',
          style: TextStyle(
            fontStyle: FontStyle.italic
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
                    color: Colors.yellow,
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
                backgroundColor: whiteText,
                child: Icon(
                  Icons.person,
                  color: text,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Extra Page')
          ],
        ),
      ),
    );
  }
}