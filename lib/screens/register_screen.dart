import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/responsive/screen_layout.dart';
import 'package:barbershop_app/utils/message.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(children: [
              Image.asset(
                'assets/logo.png',
                width: 251,
                height: 274,
              ),
              Text(
                'REGISTER',
                style: GoogleFonts.roboto(
                  fontSize: 40, 
                  color: signText, 
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 3),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 14,
                          color: signText,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    TextField(
                      controller: nameCtrl,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: inputField,
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 3, top: 10),
                      child: Text(
                        "E-mail Address",
                        style: TextStyle(
                          fontSize: 14,
                          color: signText,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    TextField(
                      controller: emailCtrl,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: inputField,
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Enter E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 3, top: 10),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 14,
                          color: signText,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: inputField,
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: primaryButton,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120, 
                      vertical: 20
                    )
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ScreenLayout(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      buildSnackBarSuccess('Register')
                    );
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 20),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: secondaryButton,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 130, 
                      vertical: 20
                    )
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(fontSize: 20),
                  )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}