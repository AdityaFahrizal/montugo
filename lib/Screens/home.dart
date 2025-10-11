import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Mechanic/UI/Carousel/carousel_controller.dart';
import 'package:montugo/Screens/Information/Rescue/rescue.dart';
import 'package:montugo/Screens/categoryEquipment.dart';
import 'package:montugo/Screens/categoryMountain.dart';
import 'package:montugo/Screens/categoryLogistic.dart';
import 'package:montugo/Screens/Berita/berita.dart'; // Import news section

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 35,
        ),
        const CarouselControllerWidget(),
        const SizedBox(
          height: 17,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Menu informasi",
                style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 19,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Gunung
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Categorymountain()),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 76,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.terrain, size: 28, color: Colors.black87),
                    SizedBox(height: 4),
                    Text("Gunung", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            // Peralatan
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Categoryequipment()),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 76,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.handyman, size: 28, color: Colors.black87),
                    SizedBox(height: 4),
                    Text("Peralatan", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            // Logistik
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryLogistic()),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 76,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.backpack, size: 28, color: Colors.black87),
                    SizedBox(height: 4),
                    Text("Logistik", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),

            // Keselamatan
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Rescue()),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 76,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.health_and_safety,
                        size: 28, color: Colors.black87),
                    SizedBox(height: 4),
                    Text("Safety", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 19,
        ),
        // This is where the news section is added
        const NewsSection(),

        const SizedBox(
          height: 19,
        ),
      ]),
    );
  }
}
