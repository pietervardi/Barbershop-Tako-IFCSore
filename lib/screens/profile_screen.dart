import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/screens/editprofile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barbershop_app/screens/login_screen.dart';
import 'package:barbershop_app/utils/message.dart';

class ProfileScreen extends StatefulWidget {
  final String? email;
  final String? username;

  const ProfileScreen({
    Key? key, 
    required this.email,
    required this.username
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _email;
  late String _username;

  @override
  void initState() {
    super.initState();
    _email = widget.email ?? "victorchan@gmail.com";
    _username = widget.username ?? "Victor Chandra";
  }

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
              radius: 80,
              backgroundColor: gray,
              child: Icon(
                Icons.person,
                color: text,
                size: 80,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            SizedBox(
              width: 400,
              child: Column(
                children: [
                  Text(
                    _username,
                    style: GoogleFonts.arapey(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    _email,
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
                    onPressed: () async {
                      final result = await Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                      );
                      if (result != null) {
                        setState(() {
                          _username = result['username'];
                          _email = result['email'];
                        });
                      }
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackBarDanger('Log Out')
                      );
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