import 'package:barbershop_app/responsive/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/screens/register_screen.dart';
import 'package:barbershop_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController EmailCtrl = TextEditingController();
  final TextEditingController PasswordCtrl = TextEditingController();
  bool rememberme = false;
  bool? verify;
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
                'LOG IN',
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
                          const EdgeInsets.only(left: 10, bottom: 3, top: 30),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return inputField;
                        }
                        return inputField;
                      }),
                      focusColor: inputField,
                      activeColor: inputField,
                      checkColor: Colors.black,
                      value: rememberme,
                      onChanged: (val) {
                        setState(() {
                          rememberme = val!;
                        });
                      }),
                  Text("Remember me")
                ],
              ),
              if (verify == null)
                Container()
              else if (verify == false)
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "E-mail or Password cannot be empty",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: primaryButton,
                        padding: EdgeInsets.symmetric(
                            horizontal: 120, vertical: 20)),
                    onPressed: () {
                      print(verify);
                      setState(() {
                        EmailCtrl.text.isEmpty || PasswordCtrl.text.isEmpty
                            ? verify = false
                            : verify = true;
                        print(verify);
                        if (verify == true) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ScreenLayout(),
                            ),
                          );
                        }
                      });
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?"),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        });
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: primaryButton),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
