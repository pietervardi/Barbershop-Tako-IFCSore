import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: true,
        backgroundColor: appBar,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('profil')
          ],
        ),
      ),
    );
  }
}