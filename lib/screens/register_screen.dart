import 'package:barbershop_app/responsive/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController NameCtrl = TextEditingController();
  final TextEditingController EmailCtrl = TextEditingController();
  final TextEditingController PasswordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            child: Column(children: [
              Image.asset(
                "logo.png",
                width: 300,
              ),
              const Text(
                'REGISTER',
                style: TextStyle(
                    fontSize: 36, color: signText, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 3),
                      child: const Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 14,
                            color: signText,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      controller: NameCtrl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: inputField,
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "Enter Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 3, top: 10),
                      child: const Text(
                        "E-mail Address",
                        style: TextStyle(
                            fontSize: 14,
                            color: signText,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      controller: EmailCtrl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: inputField,
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "Enter E-mail",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 3, top: 10),
                      child: const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 14,
                            color: signText,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      controller: PasswordCtrl,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: inputField,
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "Enter Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: primaryButton,
                        padding: EdgeInsets.symmetric(
                            horizontal: 120, vertical: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only( bottom: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: secondaryButton,
                        padding: EdgeInsets.symmetric(
                            horizontal: 130, vertical: 20)),
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
