import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JaketGunungNav extends StatelessWidget {
  const JaketGunungNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Jaket Gunung",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const JaketGunung(),
    );
  }
}

class JaketGunung extends StatelessWidget {
  const JaketGunung({super.key});

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
              'assets/images/equipmentImage/Gorpcore.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Jaket Gunung (GorpCore)",
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
              infoItem(FontAwesomeIcons.tag, "Harga: Rp 750.000"),
              infoItem(FontAwesomeIcons.weightHanging, "Berat: ± 600 gram"),
              infoItem(FontAwesomeIcons.boxOpen,
                  "Bahan: Gore-Tex / Polyester waterproof & windproof"),
              infoItem(FontAwesomeIcons.snowflake,
                  "Fungsi: Menahan angin, dingin, dan hujan di gunung"),
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
            "Jaket gunung adalah lapisan pelindung tubuh yang sangat penting saat mendaki, "
            "terutama di ketinggian dengan suhu dingin dan angin kencang. "
            "Model GORPCore kini juga menjadikan jaket gunung sebagai gaya hidup, "
            "dengan desain modern tapi tetap fungsional. "
            "Biasanya terbuat dari bahan Gore-Tex atau polyester khusus yang tahan angin (windproof) "
            "dan tahan air (waterproof), sekaligus tetap memiliki sirkulasi udara. "
            "Jaket gunung dilengkapi dengan hoodie, kantong multifungsi, dan lapisan dalam yang hangat "
            "untuk menjaga kenyamanan saat aktivitas outdoor maupun kegiatan harian dengan style kasual.",
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
