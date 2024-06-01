import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app_flutter/widgets/home_card.dart';
import 'package:test_app_flutter/widgets/location_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> menuItems = [
    "Living Room",
    "Bathroom",
    "Bedroom",
    "Kitchen",
    "Balcon",
    "Terrach"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [Color(0xFF528578), Color(0xFFF5CC62), Color(0xFFFE9490)],
          center: Alignment(0.0, 1.0),
          stops: [0.0, 0.5, 1.0],
          radius: 1.5,
        )),
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: "Welcome\n",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: "Back To Your Home",
                      style: TextStyle(
                        // fontFamily: GoogleFonts.lato().fontFamily,
                        color: Colors.yellow,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),
                ),
                Container(
                  height: 110,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset("assets/icons/search.png"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            LocationMenu(
                menuItems: menuItems,
                selectedIndex: selectedIndex,
                onItemTapped: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }),
            const SizedBox(
              height: 25,
            ),
            Text(
              "4 Active Devices",
              style: GoogleFonts.abel(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                HomeCard(
                    title: "Smart Lamp",
                    imagePath: "assets/icons/desk-lamp.png",
                    switchColor: Colors.yellow,
                    location: menuItems[selectedIndex]),
                HomeCard(
                    title: "Smart AC",
                    imagePath: "assets/icons/air-conditioner.png",
                    switchColor: Colors.blue,
                    location: menuItems[selectedIndex]),
                HomeCard(
                    title: "Smart Fan",
                    imagePath: "assets/icons/fan.png",
                    switchColor: Colors.red,
                    location: menuItems[selectedIndex]),
                HomeCard(
                    title: "Smart TV",
                    imagePath: "assets/icons/smart-tv.png",
                    switchColor: Colors.green,
                    location: menuItems[selectedIndex]),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
