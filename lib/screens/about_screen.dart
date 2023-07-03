import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/responsive/screen_layout.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: const BoxDecoration(
                    color: whiteText
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 0.8,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.424,
                decoration: const BoxDecoration(
                  color: backgroundColor
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.424,
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 30
                ),
                decoration: const BoxDecoration(
                  color: whiteText,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70)
                  )
                ),
                child: Column(
                  children: [
                    const Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      child: Text(
                        "Welcome to our barbershop app! We connect barbers and clients, making it easy to find the perfect barber and book appointments on your mobile device.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.6)
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Material(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ScreenLayout(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 75
                          ),
                          child: const Text(
                            'Get Start',
                            style: TextStyle(
                              color: whiteText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}