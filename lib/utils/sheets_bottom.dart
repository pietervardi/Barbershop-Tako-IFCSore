import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showSheetsBottom(BuildContext context) {
  showModalBottomSheet(
    enableDrag: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                'Share to your friends',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.twitter,
                color: twitter,
              ),
              title: const Text(
                'Twitter',
                style: TextStyle(
                  color: twitter,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {

              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.whatsapp,
                color: whatsApp,
              ),
              title: const Text(
                'WhatsApp',
                style: TextStyle(
                  color: whatsApp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {

              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.telegram_outlined,
                color: telegram,
              ),
              title: const Text(
                'Telegram',
                style: TextStyle(
                  color: telegram,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {

              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.instagram,
                color: instagram,
              ),
              title: const Text(
                'Instagram',
                style: TextStyle(
                  color: instagram,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {

              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.facebook_outlined,
                color: facebook,
              ),
              title: const Text(
                'Facebook',
                style: TextStyle(
                  color: facebook,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {

              },
            ),
          ],
        )
      );
    },
  );
}