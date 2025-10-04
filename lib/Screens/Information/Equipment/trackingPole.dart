import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrekkingPoleNav extends StatelessWidget {
  const TrekkingPoleNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Trekking Pole",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const TrekkingPole(),
    );
  }
}

class TrekkingPole extends StatelessWidget {
  const TrekkingPole({super.key});

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
              'assets/images/equipmentImage/Pole.png',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Trekking Pole",
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
              infoItem(FontAwesomeIcons.tag, "Harga: Rp 150.000"),
              infoItem(
                  FontAwesomeIcons.weightHanging, "Berat: ± 250 gram / batang"),
              infoItem(
                  FontAwesomeIcons.boxOpen, "Bahan: Alumunium alloy / karbon"),
              infoItem(FontAwesomeIcons.personHiking,
                  "Fungsi: Membantu keseimbangan saat mendaki/menurun"),
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
            "Trekking pole adalah tongkat bantu yang digunakan pendaki untuk menjaga keseimbangan "
            "dan mengurangi beban pada lutut saat mendaki maupun menuruni jalur terjal. "
            "Dengan desain lipat atau teleskopik, trekking pole mudah disimpan dan dibawa. "
            "Bahan yang umum digunakan adalah alumunium alloy (kuat dan ekonomis) atau karbon (lebih ringan). "
            "Peralatan ini sangat disarankan terutama pada jalur panjang, berbatu, atau curam.",
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
