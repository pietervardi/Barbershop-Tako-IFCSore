import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'EditProfile.dart';

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
      ),
      body: Center(
        child: Column(children: [
          const Padding(padding: EdgeInsets.all(10)),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
              'https://cdn.sharechat.com/16ed0584-5fb7-494a-a051-28312a36b581-807fabc4-296c-45e2-8eba-b97f4d716d30.jpeg',
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          SizedBox(
            width: 400,
            child: Column(children: [
              Text(
                'Pieter Vardi',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                'aoshoka@pieter.vardi',
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.deepOrangeAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => editProfile());
                    Navigator.push(context, route);
                  },
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 15),
                  )),
              Padding(padding: EdgeInsets.all(50)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 15),
                  )),
            ]),
          ),
        ]),
      ),
    );
  }
}