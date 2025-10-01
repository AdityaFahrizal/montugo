import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BromoNav extends StatelessWidget {
  const BromoNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // background putih
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // putih
        title: Text(
          "Gunung Bromo",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Bromo(),
    );
  }
}

class Bromo extends StatelessWidget {
  const Bromo({super.key});

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
              'assets/images/mountainImage/JawaTimurImage/bromo.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Gunung Bromo",
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
                  "Lokasi: Probolinggo–Pasuruan–Lumajang–Malang, Jawa Timur"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 2.329 mdpl"),
              infoItem(FontAwesomeIcons.route,
                  "Jalur Pendakian: Cemoro Lawang, Wonokitri, Jemplang"),
              infoItem(FontAwesomeIcons.clock,
                  "Waktu Tempuh: ± 1–2 jam (dari basecamp)"),
              infoItem(FontAwesomeIcons.chartLine,
                  "Tingkat Kesulitan: Mudah"),
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
            "Gunung Bromo merupakan salah satu destinasi wisata gunung paling terkenal di Indonesia, "
            "terletak di kawasan Taman Nasional Bromo Tengger Semeru. Gunung ini terkenal dengan kawah "
            "aktifnya yang mengeluarkan asap belerang, serta panorama Lautan Pasir yang luas. Pendaki dan "
            "wisatawan biasanya datang untuk menikmati keindahan matahari terbit dari Penanjakan, "
            "yang menawarkan pemandangan menakjubkan Gunung Semeru, Gunung Batok, dan Bromo sekaligus. "
            "Jalur menuju puncak Bromo relatif mudah, sehingga lebih populer sebagai wisata alam daripada "
            "pendakian ekstrem. Suasana khas suku Tengger juga menambah daya tarik budaya di sekitar Bromo.",
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
