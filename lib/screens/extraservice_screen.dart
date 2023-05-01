import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/utils/global_variable.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtraServiceScreen extends StatefulWidget {
  const ExtraServiceScreen({Key? key}) : super(key: key);

  @override
  State<ExtraServiceScreen> createState() => _ExtraServiceScreenState();
}

class _ExtraServiceScreenState extends State<ExtraServiceScreen> {
  List<Map<String, String>> extras = [
    {
      'name': 'Massage',
      'image': 'assets/extra/massage.jpg',
      'description': 'Get your muscle relaxed~'
    },
    {
      'name': 'Hair Wash',
      'image': 'assets/extra/hair_wash.jpeg',
      'description': 'Let us clean your hair thoroughly~'
    },
    {
      'name': 'Hair Coloring',
      'image': 'assets/extra/hair_coloring.jpg',
      'description': 'New color, new hair~'
    },
    {
      'name': 'Hair Modeling',
      'image': 'assets/extra/cornrow.jpg',
      'description': 'Choose any model and see it on your own head~'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              buildTitleText('EXTRA SERVICE'),
              const SizedBox(height: 12,),
              Column(
                children: [
                  for (var extra in extras)
                    Column(
                      children: [
                        ExtraServiceCard(
                          name: extra['name']!,
                          image: extra['image']!,
                          description: extra['description']!,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExtraServiceCard extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const ExtraServiceCard({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 140,
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: barberBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 155,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: cardPictureBorder,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              )
            ),
            const SizedBox(width: 23),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    name,
                    style: GoogleFonts.pacifico(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),                      
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}