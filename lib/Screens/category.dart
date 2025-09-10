import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorymountain extends StatelessWidget {
  const Categorymountain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Menu Informasi",
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // 🔍 Search bar
          SizedBox(
            width: 362,
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
          const SizedBox(height: 20),

          // 🔥 Gunung Card
          buildMountainCard(
            context,
            title: "Gunung Papandayan",
            height: "2.665 Mdpl",
            imagePath:
                "assets/images/mountainImage/JawaBaratImage/Papandayan.jpg",
          ),
          buildMountainCard(
            context,
            title: "Gunung Prau",
            height: "2.565 Mdpl",
            imagePath:
                "assets/images/mountainImage/JawaTengahImage/Prau.jpg",
          ),
          buildMountainCard(
            context,
            title: "Gunung Bromo",
            height: "2.329 Mdpl",
            imagePath:
                "assets/images/mountainImage/JawaTimurImage/bromo.jpg",
          ),
          buildMountainCard(
            context,
            title: "Gunung Semeru",
            height: "3.676 Mdpl",
            imagePath:
                "assets/images/mountainImage/JawaTimurImage/semeru.jpg",
          ),
        ],
      ),
    );
  }

  // ✅ Widget reusable buat card gunung
  Widget buildMountainCard(BuildContext context,
      {required String title,
      required String height,
      required String imagePath}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 19),
      width: 362,
      height: 139,
      child: Stack(
        children: [
          // Gambar background
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 362,
              height: 139,
              fit: BoxFit.cover,
            ),
          ),

          // Overlay biar teks lebih jelas
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // Teks & Tombol
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
                    onPressed: () {
                      // pindah ke halaman detail
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MountainDetailPage(),
                        ),
                      );
                    },
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

// 🔎 Contoh halaman detail
class MountainDetailPage extends StatelessWidget {
  const MountainDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Gunung")),
      body: const Center(
        child: Text("Halaman detail gunung di sini"),
      ),
    );
  }
}
