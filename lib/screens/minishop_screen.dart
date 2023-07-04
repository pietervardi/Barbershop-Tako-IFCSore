import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/utils/global_variable.dart';
import 'package:barbershop_app/utils/sheets_bottom.dart';

class MiniShopScreen extends StatefulWidget {
  const MiniShopScreen({Key? key}) : super(key: key);

  @override
  State<MiniShopScreen> createState() => _MiniShopScreenState();
}

class _MiniShopScreenState extends State<MiniShopScreen> {
  List<Map<String, dynamic>> items = [
    {
      "nama": "Hair Pomade",
      "gambar": "assets/shop/pomade.jpg",
      "harga": "Rp. 70.000"
    },
    {
      "nama": "Hair Powder",
      "gambar": "assets/shop/powder.png",
      "harga": "Rp. 80.000"
    },
    {
      "nama": "Hair Spray",
      "gambar": "assets/shop/spray.png",
      "harga": "Rp. 195.000"
    },
    {
      "nama": "Hair Serum",
      "gambar": "assets/shop/serum.jpg",
      "harga": "Rp. 1.000.000"
    },
    {
      "nama": "Hair Gel",
      "gambar": "assets/shop/hair_gel.jpg",
      "harga": "Rp. 20.000"
    },
    {
      "nama": "Hair Oil",
      "gambar": "assets/shop/hair_oil.jpeg",
      "harga": "Rp. 40.000"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              buildTitleText('MINI SHOP'),
              SizedBox(
                width: 400,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.72,
                  children: List.generate(items.length, (index) {
                    return ItemCard(
                      nama: items[index]['nama'],
                      gambar: items[index]['gambar'],
                      harga: items[index]['harga'],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String nama;
  final String gambar;
  final String harga;

  const ItemCard({
    Key? key,
    required this.nama,
    required this.gambar,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: cardBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            width: 200,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                gambar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              nama,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(
              harga,
              style: const TextStyle(fontSize: 12, color: priceTag),
            ),
          ),
          GestureDetector(
            onTap: () {
              showSheetsBottom(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2, right: 10),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}