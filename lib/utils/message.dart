import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';

SnackBar buildSnackBarSuccess(String type) {
  return SnackBar(
    elevation: 0,
    backgroundColor: lightGreen,
    content: ListTile(
      leading: const CircleAvatar(
        backgroundColor: green,
        child: Icon(
          Icons.sentiment_satisfied_outlined,
          color: whiteText,
          size: 30,
        ),
      ),
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.w700
        ),
      ),
      subtitle: Text(
        'Anda Berhasil $type',
        style: const TextStyle(
          fontWeight: FontWeight.w600
        ),
      ),
    ),
  );
}

SnackBar buildSnackBarDanger(String type) {
  return SnackBar(
    elevation: 0,
    backgroundColor: lightRed,
    content: ListTile(
      leading: const CircleAvatar(
        backgroundColor: red,
        child: Icon(
          Icons.sentiment_dissatisfied_outlined,
          color: whiteText,
          size: 30,
        ),
      ),
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.w700
        ),
      ),
      subtitle: Text(
        'Anda Berhasil $type',
        style: const TextStyle(
          fontWeight: FontWeight.w600
        ),
      ),
    ),
  );
}