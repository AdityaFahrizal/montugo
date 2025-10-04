import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PonchoNav extends StatelessWidget {
  const PonchoNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Jas Hujan Poncho",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Poncho(),
    );
  }
}

class Poncho extends StatelessWidget {
  const Poncho({super.key});

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
              'assets/images/logisticImage/poncho.png',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Jas Hujan Poncho",
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
              infoItem(FontAwesomeIcons.tag, "Harga: Rp 10.000 - 45.000"),
              infoItem(FontAwesomeIcons.weightHanging, "Berat: 250 gram"),
              infoItem(
                  FontAwesomeIcons.rulerCombined, "Ukuran: All Size (dewasa)"),
              infoItem(FontAwesomeIcons.clipboardList,
                  "Bahan: PVC / Polyester anti air"),
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
            "Jas hujan poncho adalah pelindung tubuh dari hujan dengan model longgar "
            "seperti mantel yang menutupi hingga lutut. Cocok digunakan saat mendaki gunung "
            "karena praktis, mudah dipakai, dan dapat melindungi tubuh serta tas dari hujan. "
            "Bahan anti airnya membuat pendaki tetap kering dan nyaman meskipun hujan deras. "
            "Poncho juga bisa difungsikan sebagai flysheet darurat untuk melindungi barang bawaan.",
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
