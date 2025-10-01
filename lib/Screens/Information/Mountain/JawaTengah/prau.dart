import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrauNav extends StatelessWidget {
  const PrauNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Gunung Prau",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Prau(),
    );
  }
}

class Prau extends StatelessWidget {
  const Prau({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Utama
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/mountainImage/JawaTengahImage/Prau.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Gunung Prau",
            style: GoogleFonts.istokWeb(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: const Color.fromARGB(255, 54, 69, 79),
            ),
          ),
          const SizedBox(height: 8),

          // Informasi Ringkas
          Column(
            children: [
              infoItem(FontAwesomeIcons.mapMarkerAlt,
                  "Lokasi: Wonosobo, Jawa Tengah"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 2.565 mdpl"),
              infoItem(FontAwesomeIcons.route,
                  "Jalur Pendakian: Patak Banteng, Dieng, Kalilembu, Dwarawati"),
              infoItem(FontAwesomeIcons.clock, "Waktu Tempuh: ± 2–4 jam"),
              infoItem(FontAwesomeIcons.chartLine,
                  "Tingkat Kesulitan: Mudah – Menengah"),
            ],
          ),
          const SizedBox(height: 20),

          // Deskripsi
          Text(
            "Deskripsi",
            style: GoogleFonts.istokWeb(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color.fromARGB(255, 54, 69, 79),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Gunung Prau dikenal sebagai ‘gunung seribu bukit’ karena dari puncaknya terlihat deretan bukit "
            "yang indah seperti gelombang lautan hijau. Dengan ketinggian 2.565 mdpl, gunung ini relatif "
            "ramah untuk pendaki pemula karena waktu tempuh ke puncak hanya sekitar 2–4 jam. "
            "Puncak Prau sangat populer karena menyajikan pemandangan sunrise terbaik di Jawa Tengah, "
            "dengan latar belakang Gunung Sindoro, Sumbing, Merapi, dan Merbabu. Suasana dingin khas Dieng "
            "serta hamparan padang rumput luas menjadikan Prau sebagai salah satu destinasi favorit pendaki muda.",
            style: GoogleFonts.istokWeb(
              fontSize: 15,
              height: 1.6,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Widget untuk baris info dengan icon
  Widget infoItem(IconData icon, String text) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black26,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: const Color.fromARGB(255, 54, 69, 79)),
        title: Text(
          text,
          style: GoogleFonts.istokWeb(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
