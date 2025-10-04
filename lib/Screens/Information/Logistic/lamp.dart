import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LampuNav extends StatelessWidget {
  const LampuNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Headlamp / Lampu Gunung",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Lampu(),
    );
  }
}

class Lampu extends StatelessWidget {
  const Lampu({super.key});

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
              'assets/images/logisticImage/lampu.png',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Headlamp / Lampu Gunung",
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
              infoItem(FontAwesomeIcons.tag, "Harga: Rp 120.000"),
              infoItem(FontAwesomeIcons.weightHanging, "Berat: 200 gram"),
              infoItem(FontAwesomeIcons.bolt,
                  "Sumber Daya: Baterai AA / rechargeable"),
              infoItem(FontAwesomeIcons.lightbulb,
                  "Kekuatan Cahaya: 300 – 500 lumens"),
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
            "Headlamp atau lampu gunung adalah perlengkapan wajib untuk pendakian malam hari "
            "atau saat kondisi gelap di dalam tenda. Dibandingkan senter biasa, headlamp lebih praktis "
            "karena bisa dipasang di kepala sehingga kedua tangan tetap bebas bergerak. "
            "Lampu ini biasanya memiliki beberapa mode pencahayaan seperti terang penuh, redup, dan strobo. "
            "Dengan kekuatan cahaya 300–500 lumens, headlamp mampu menerangi jalur pendakian dengan baik "
            "serta hemat energi jika menggunakan baterai isi ulang.",
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
