import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('EDIT PROFILE'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: appBar,
      ),
      body: Center(
        child: Column(children: [
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
            width: 300,
            child: Column(children: [
              TextFormField(
                controller: textFieldController1,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person
                  ),
                  hintText: 'Victor Chandra',
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: textFieldController2,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email
                  ),
                  hintText: 'victorchan@gmail.com',
                ),
                style: const TextStyle(fontSize: 20),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  backgroundColor: editButton,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 85, 
                    vertical: 20
                  )
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    'username': textFieldController1.text,
                    'email': textFieldController2.text,
                  });
                },
                child: Text(
                  'Confirm Changes',
                  style: GoogleFonts.arapey(
                    fontSize: 18,
                    fontStyle: FontStyle.italic
                  ),
                )),
              const Padding(
                padding: EdgeInsets.all(50)
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                  backgroundColor: logoutButton,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100, 
                    vertical: 20
                  )
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.arapey(
                    fontSize: 18,
                    fontStyle: FontStyle.italic
                  ),
                )
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}