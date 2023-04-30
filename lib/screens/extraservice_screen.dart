import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/utils/appbar.dart';

class ExtraServiceScreen extends StatefulWidget {
  const ExtraServiceScreen({Key? key}) : super(key: key);

  @override
  State<ExtraServiceScreen> createState() => _ExtraServiceScreenState();
}

class _ExtraServiceScreenState extends State<ExtraServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Extra Page')
          ],
        ),
      ),
    );
  }
}