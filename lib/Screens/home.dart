import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Mechanic/UI/Carousel/carousel_controller.dart';
import 'package:montugo/Screens/categoryEquipment.dart';
import 'package:montugo/Screens/Information/Rescue/rescue.dart';
import 'package:montugo/Screens/categoryMountain.dart';
import 'package:montugo/Screens/Berita/berita.dart';
import 'package:montugo/Screens/tips_and_tricks.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        const CarouselControllerWidget(),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                "Menu Informasi",
                style: GoogleFonts.istokWeb(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF36454F),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

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

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const EquipmentListPage(jenis: "Peralatan")),
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

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const EquipmentListPage(jenis: "Logistik")),
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
                    Text("Keselamatan", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const NewsSection(),
        const SizedBox(
          height: 12,
        ),
        const TipsAndTricks(),
      ]),
    );
  }
}
