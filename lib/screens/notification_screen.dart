import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> items = [
    {
      "judul": "Reserved Services",
      "waktu": "2 hours ago",
      "desc1":
          "Thank you for the reservation for the 17th April 2023, 13.00 WIB",
      "desc2": "We will be waiting for your arrival~"
    },
    {
      "judul": "Special Ramadhan Discount!",
      "waktu": "3 days ago",
      "desc1":
          "Discount up to 65% for various services from 18th April 2023 until 29th April 2023!",
      "desc2": "Don't miss it!"
    },
    {
      "judul": "Reserved Services",
      "waktu": "One week ago",
      "desc1":
          "Thank you for the reservation for the 11th April 2023, 11.00 WIB",
      "desc2": "We will be waiting for your arrival~"
    },
    {
      "judul": "Closed Notice",
      "waktu": "One week ago",
      "desc1":
          "We will be taking a break during 22nd April 2023 to celebrate Ramahdhan!",
      "desc2": "Will open on the next day 23rd April 2023!"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('NOTIFICATION'),
        centerTitle: true,
        backgroundColor: appBar,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: List.generate(items.length, (index) {
              return NotificationCard(
                judul: items[index]["judul"],
                waktu: items[index]["waktu"],
                desc1: items[index]["desc1"],
                desc2: items[index]["desc2"],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String judul;
  final String waktu;
  final String desc1;
  final String desc2;

  const NotificationCard({
    Key? key,
    required this.judul,
    required this.waktu,
    required this.desc1,
    required this.desc2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        border: Border.all(width: 1, color: notificationBorder),
      ),
      height: 100,
      child: ListTile(
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                desc1,
                style: const TextStyle(fontSize: 12),
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              desc2,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: Text(
          waktu,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11
          ),
        ),
      ),
    );
  }
}