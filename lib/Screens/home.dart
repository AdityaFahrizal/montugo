import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Mechanic/UI/Carousel/carouselController.dart';
import 'package:montugo/Screens/Information/Mountain/JawaBarat/gede.dart';
import 'package:montugo/Screens/Information/Rescue/rescue.dart';
import 'package:montugo/Screens/categoryEquipment.dart';
import 'package:montugo/Screens/categoryMountain.dart';
import 'package:montugo/Screens/categoryLogistic.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Hi, Senang Bertemu Denganmu Hari Ini",
                style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          width: 362,
          height: 50,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0),
                width: 1,
              ),
            ),
            child: SearchBar(
              textInputAction: TextInputAction.search,
              hintText: "Cari di sini...",
              leading: const Icon(Icons.search),
              backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
              elevation: const WidgetStatePropertyAll(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 23,
        ),
        const Carouselcontroller(),
        const SizedBox(
          height: 19,
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
                      builder: (context) => const Categorylogistic()),
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
                  MaterialPageRoute(
                      builder: (context) => const Rescue()),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Kategori Barang",
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
            Stack(
              children: [
                Container(
                  width: 171,
                  height: 180,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 69, 79),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                            spreadRadius: 0.5)
                      ]),
                ),
                Container(
                  width: 171,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/equipmentImage/Gorpcore.jpg'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 110)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 12)),
                        Text(
                          "Trekking Pole",
                          style: GoogleFonts.istokWeb(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 171,
                  height: 180,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 69, 79),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                            spreadRadius: 0.5)
                      ]),
                ),
                Container(
                  width: 171,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/equipmentImage/Pole.png'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 110)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 12)),
                        Text(
                          "Trekking Pole",
                          style: GoogleFonts.istokWeb(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GedeNav(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    width: 171,
                    height: 180,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 69, 79),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 4,
                          offset: const Offset(0, 5),
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                  ),

                  // Gambar
                  Container(
                    width: 171,
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/equipmentImage/Pole.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Text
                  const Positioned(
                    top: 110,
                    left: 12,
                    child: Text(
                      "Trekking Pole",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 171,
                  height: 180,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 69, 79),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                            spreadRadius: 0.5)
                      ]),
                ),
                Container(
                  width: 171.1,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/equipmentImage/Gorpcore.jpg'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 110)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 12)),
                        Text(
                          "Trekking Pole",
                          style: GoogleFonts.istokWeb(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
