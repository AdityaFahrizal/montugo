import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/Information/Mountain/JawaBarat/gede.dart';
import 'package:montugo/Screens/Information/Mountain/JawaBarat/papandayan.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTengah/prau.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTimur/bromo.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTimur/semeru.dart';

class Categorymountain extends StatelessWidget {
  const Categorymountain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Gunung",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const kategorigunung(),
    );
  }
}

class kategorigunung extends StatelessWidget {
  const kategorigunung({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: SearchBar(
                textInputAction: TextInputAction.search,
                hintText: "Cari di sini...",
                leading: const Icon(Icons.search),
                backgroundColor:
                    const WidgetStatePropertyAll(Colors.transparent),
                elevation: const WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildMountainCard(
                context,
                title: "Gunung Papandayan",
                height: "2.665 Mdpl",
                imagePath:
                    "assets/images/mountainImage/JawaBaratImage/Papandayan.jpg",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PapandayanNav()),
                  );
                },
              ),
              buildMountainCard(
                context,
                title: "Gunung Prau",
                height: "2.565 Mdpl",
                imagePath:
                    "assets/images/mountainImage/JawaTengahImage/Prau.jpg",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrauNav()),
                  );
                },
              ),
              buildMountainCard(
                context,
                title: "Gunung Bromo",
                height: "2.329 Mdpl",
                imagePath:
                    "assets/images/mountainImage/JawaTimurImage/bromo.jpg",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BromoNav()),
                  );
                },
              ),
              buildMountainCard(
                context,
                title: "Gunung Semeru",
                height: "3.676 Mdpl",
                imagePath:
                    "assets/images/mountainImage/JawaTimurImage/semeru.jpg",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SemeruNav()),
                  );
                },
              ),
              buildMountainCard(
                context,
                title: "Gunung Gede",
                height: "2.958 Mdpl",
                imagePath: "assets/images/JawaBarat.jpg",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GedeNav()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget buildMountainCard(
    BuildContext context, {
    required String title,
    required String height,
    required String imagePath,
    required VoidCallback onPressed, // 👈 tambahan
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 19),
      width: double.infinity,
      height: 139,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 139,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  height,
                  style: GoogleFonts.istokWeb(
                    fontSize: 14,
                    color: Colors.amber,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    onPressed: onPressed,
                    child: const Text("See details"),
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
