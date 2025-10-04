import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TendaNav extends StatelessWidget {
  const TendaNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Tenda Dome Camping 2P",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Tenda(),
    );
  }
}

class Tenda extends StatelessWidget {
  const Tenda({super.key});

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
              'assets/images/logisticImage/tenda.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Tenda Dome Camping 2P",
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
              infoItem(FontAwesomeIcons.tag, "Harga: Rp 330.000 - 450.000"),
              infoItem(FontAwesomeIcons.warehouse, "Kapasitas: 2 - 4 orang"),
              infoItem(FontAwesomeIcons.weightHanging, "Berat: 2,5 kg"),
              infoItem(
                  FontAwesomeIcons.rulerCombined, "Ukuran: 200 x 150 x 120 cm"),
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
            "Tenda Dome Camping 2P adalah pilihan ideal untuk kegiatan outdoor ringan seperti camping keluarga, "
            "hiking santai, atau acara sekolah. Ringan, mudah dipasang, dan tahan terhadap hujan ringan berkat bahan polyester tahan air. "
            "Cocok untuk 2 orang dengan ventilasi yang baik agar tetap nyaman digunakan.",
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
