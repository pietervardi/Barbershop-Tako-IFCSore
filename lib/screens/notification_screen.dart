import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('NOTIFICATION'),
        centerTitle: true,
        backgroundColor: appBar,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Notifikasi')
          ],
        ),
      ),
    );
  }
}