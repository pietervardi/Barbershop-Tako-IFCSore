import 'package:flutter/material.dart';
import 'package:barbershop_app/utils/colors.dart';
import 'package:barbershop_app/screens/profile_screen.dart';
import 'package:barbershop_app/screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hair = true;
  bool barber = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBar,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'BARBERSHOP',
          style: TextStyle(
            fontStyle: FontStyle.italic
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                ),
                child: const Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: const Text(
                    '4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: CircleAvatar(
                backgroundColor: whiteText,
                child: Icon(
                  Icons.person,
                  color: text,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15,),

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
                        color: hair ? buttonFilterStroke.withOpacity(0.5) : buttonFilterStroke.withOpacity(0),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: buttonFilterStroke),
                      ),
                      child: const Center(
                        child: Text(
                          'Hair',
                          style: TextStyle(
                            color: buttonFilterText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40,),
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
                        color: barber ? buttonFilterStroke.withOpacity(0.5) : buttonFilterStroke.withOpacity(0),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: buttonFilterStroke),
                      ),
                      child: const Center(
                        child: Text(
                          'Barber',
                          style: TextStyle(
                            color: buttonFilterText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 26,),

              if (hair)
                SizedBox(
                  width: 400,
                  child: Center(
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 20,),
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
                          const SizedBox(height: 20),
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

  const HaircutCard({
    Key? key, 
    required this.name, 
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: pictureBorder),
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
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
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
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: barberBorder),
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
              )
            ),
            const SizedBox(width: 23),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Arial',
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
                      maxLines: 2,
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