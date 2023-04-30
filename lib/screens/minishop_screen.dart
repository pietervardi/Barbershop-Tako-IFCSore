import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/utils/appbar.dart';

class MiniShopScreen extends StatefulWidget {
  const MiniShopScreen({Key? key}) : super(key: key);

  @override
  State<MiniShopScreen> createState() => _MiniShopScreenState();
}

class _MiniShopScreenState extends State<MiniShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Shop Page')
          ],
        ),
      ),
    );
  }
}