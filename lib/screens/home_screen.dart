import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  bool hair = true;
  bool barber = false;
  bool showBanner = true;

  List<Map<String, String>> haircuts = [
    {
      'name': 'Undercut',
      'image': 'assets/hair/undercuts.jpeg',
    },
    {
      'name': 'Buzz Cut',
      'image': 'assets/hair/buzzcut.jpg',
    },
    {
      'name': 'French Crop',
      'image': 'assets/hair/french_crop.jpg',
    },
    {
      'name': 'Comma Hair',
      'image': 'assets/hair/comma_hair.jpg',
    },
    {
      'name': 'Comb Over',
      'image': 'assets/hair/comb_over.jpg',
    },
    {
      'name': 'Mullet',
      'image': 'assets/hair/mullet.jpg',
    },
    {
      'name': 'Two Blocks',
      'image': 'assets/hair/two_blocks.jpeg',
    },
    {
      'name': 'Fluffy',
      'image': 'assets/hair/fluffy.jpg',
    },
  ];

  List<Map<String, String>> barbers = [
    {
      'name': 'John Flick',
      'image': 'assets/barber/barber1.jpg',
      'age': '26',
      'bio': "I'll do it for you, Smile & Happy Together"
    },
    {
      'name': 'Sheid Hulian',
      'image': 'assets/barber/barber2.jpeg',
      'age': '20',
      'bio': "Nothing Perfect, Everything is setled"
    },
    {
      'name': 'Alex Stone',
      'image': 'assets/barber/barber3.jpeg',
      'age': '22',
      'bio': "Let'go, Let's go, Beat it all"
    },
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (showBanner)
                MaterialBanner(
                  backgroundColor: Colors.green,
                  leading: const Icon(
                    Icons.local_offer,
                    color: Colors.white,
                  ),
                  content: const Text(
                    '10% off for Eid Mubarak!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showBanner = false;
                        });
                      },
                      child: const Text(
                        'DISMISS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        hair = true;
                        barber = false;
                      });
                    },
                    child: Container(
                      width: 115,
                      height: 37,
                      decoration: BoxDecoration(
                        color: hair
                            ? buttonFilterStroke.withOpacity(0.5)
                            : buttonFilterStroke.withOpacity(0),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: buttonFilterStroke),
                      ),
                      child: Center(
                        child: Text(
                          'Hair',
                          style: GoogleFonts.roboto(
                            color: buttonFilterText,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        hair = false;
                        barber = true;
                      });
                    },
                    child: Container(
                      width: 115,
                      height: 37,
                      decoration: BoxDecoration(
                        color: barber
                            ? buttonFilterStroke.withOpacity(0.5)
                            : buttonFilterStroke.withOpacity(0),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: buttonFilterStroke),
                      ),
                      child: Center(
                        child: Text(
                          'Barber',
                          style: GoogleFonts.roboto(
                            color: buttonFilterText,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              if (hair)
                SizedBox(
                  width: 400,
                  child: Center(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15
                      ),
                      children: haircuts
                        .map((haircut) => HaircutCard(
                          name: haircut['name']!,
                          image: haircut['image']!,
                        ))
                        .toList(),
                    ),
                  ),
                ),
              if (barber)
                Column(
                  children: [
                    for (var barber in barbers)
                      Column(
                        children: [
                          BarberCard(
                            name: barber['name']!,
                            image: barber['image']!,
                            age: barber['age']!,
                            bio: barber['bio']!,
                          ),
                          const SizedBox(height: 10),
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

class HaircutCard extends StatelessWidget {
  final String name;
  final String image;

  const HaircutCard({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: pictureBorder),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                width: 73,
                height: 20,
                decoration: BoxDecoration(
                  color: whiteText.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                      color: whiteText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BarberCard extends StatelessWidget {
  final String name;
  final String image;
  final String age;
  final String bio;

  const BarberCard({
    Key? key,
    required this.name,
    required this.image,
    required this.age,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: barberBorder),
      ),
      child: Container(
        width: 330,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cardBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: whiteText,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 23),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.pacifico(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '($age)',
                          style: const TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        bio,
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
      ),
    );
  }
}