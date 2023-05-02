import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/responsive/screen_layout.dart';
import 'package:barbershop_app/screens/register_screen.dart';
import 'package:barbershop_app/utils/message.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool rememberMe = false;
  bool? verify;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 340,
            child: Column(children: [
              Image.asset(
                'assets/logo.png',
                width: 251,
                height: 274,
              ),
              Text(
                'LOG IN',
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
                        "E-mail Address",
                        style: TextStyle(
                            fontSize: 14,
                            color: signText,
                            fontWeight: FontWeight.bold),
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
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 3, top: 30),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 14,
                            color: signText,
                            fontWeight: FontWeight.bold),
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
                      value: rememberMe,
                      onChanged: (val) {
                        setState(() {
                          rememberMe = val!;
                        });
                      }),
                  const Text("Remember me")
                ],
              ),
              if (verify == null)
                Container()
              else if (verify == false)
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 20)),
                    onPressed: () {
                      setState(() {
                        emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty
                            ? verify = false
                            : verify = true;
                        if (verify == true) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ScreenLayout(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            buildSnackBarSuccess('Login')
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
                  const Text("Don't have an account ?"),
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
