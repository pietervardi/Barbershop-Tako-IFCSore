import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/screens/editprofile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  final String? email;
  final String? username;

  const ProfileScreen({
    Key? key, 
    required this.email,
    required this.username
  }) : super(key: key);

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
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                'https://cdn.sharechat.com/16ed0584-5fb7-494a-a051-28312a36b581-807fabc4-296c-45e2-8eba-b97f4d716d30.jpeg',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 400,
              child: Column(
                children: [
                  Text(
                    username??"Pieter Vardi",
                    style: GoogleFonts.arapey(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    email??"Pieter@vardi.aoshoka",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 20
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10)
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: editButton,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100, 
                        vertical: 20
                      )
                    ),
                    onPressed: () {
                      Route route =
                        MaterialPageRoute(builder: (context) => const EditProfileScreen());
                      Navigator.push(context, route);
                    },
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.arapey(
                        fontSize: 18,
                        fontStyle: FontStyle.italic
                      ),
                    )
                  ),
                  const Padding(padding: EdgeInsets.all(50)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      backgroundColor: logoutButton,
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20)
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Log Out',
                      style: GoogleFonts.arapey(
                        fontSize: 18,
                        fontStyle: FontStyle.italic
                      ),
                    )
                  ),
                ]
              ),
            ),
          ]
        ),
      ),
    );
  }
}