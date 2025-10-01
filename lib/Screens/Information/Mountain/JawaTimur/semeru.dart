import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SemeruNav extends StatelessWidget {
  const SemeruNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Gunung Semeru",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Semeru(),
    );
  }
}

class Semeru extends StatelessWidget {
  const Semeru({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/mountainImage/JawaTimurImage/semeru.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Gunung Semeru",
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
                  "Lokasi: Lumajang–Malang, Jawa Timur"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 3.676 mdpl"),
              infoItem(FontAwesomeIcons.route,
                  "Jalur Pendakian: Ranu Pani – Ranu Kumbolo – Kalimati – Arcopodo"),
              infoItem(
                  FontAwesomeIcons.clock, "Waktu Tempuh: ± 2–3 hari pendakian"),
              infoItem(FontAwesomeIcons.chartLine, "Tingkat Kesulitan: Tinggi"),
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
            "Gunung Semeru adalah gunung tertinggi di Pulau Jawa dengan puncaknya, Mahameru, "
            "mencapai ketinggian 3.676 mdpl. Jalur pendakian biasanya dimulai dari Ranu Pani, "
            "melewati danau indah Ranu Kumbolo, lalu menuju Kalimati dan Arcopodo sebelum "
            "melakukan summit attack ke puncak Mahameru. Gunung ini terkenal dengan letusan kecil "
            "kawah Jonggring Saloka yang aktif setiap 20–30 menit. Pemandangan alam yang luar biasa "
            "menjadikan Semeru salah satu tujuan favorit pendaki di Indonesia, meski jalurnya cukup berat "
            "dan membutuhkan fisik serta persiapan matang.",
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
