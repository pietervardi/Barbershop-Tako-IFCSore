import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';

SnackBar buildSnackBarSuccess() {
  return const SnackBar(
    elevation: 0,
    backgroundColor: lightGreen,
    content: ListTile(
      leading: CircleAvatar(
        backgroundColor: green,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.w700
        ),
      ),
      subtitle: Text(
        'Anda Berhasil Login',
        style: TextStyle(
          fontWeight: FontWeight.w600
        ),
      ),
    ),
  );
}