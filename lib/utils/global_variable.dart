import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barbershop_app/screens/extraservice_screen.dart';
import 'package:barbershop_app/screens/home_screen.dart';
import 'package:barbershop_app/screens/minishop_screen.dart';
import 'package:barbershop_app/screens/reservation_screen.dart';

const homeScreenItems = [
  HomeScreen(),
  ExtraServiceScreen(),
  MiniShopScreen(),
  ReservationScreen()
];

Widget buildTitleText(String title) {
  return Text(
    title,
    style: GoogleFonts.eater(
      fontSize: 35,
    ),
  ); 
}