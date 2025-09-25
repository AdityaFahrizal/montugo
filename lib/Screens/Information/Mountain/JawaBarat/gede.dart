import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GedeNav extends StatelessWidget {
  const GedeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF36454F), // charcoal
        title: Text(
          "Gunung Gede Pangrango",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Gede(),
    );
  }
}

class Gede extends StatelessWidget {
  const Gede({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 15)),
          Center(
            child: Container(
              width: 362,
              height: 227,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/mountainImage/JawaBaratImage/Gede.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Gunung Gede Pangrango",
              style: GoogleFonts.istokWeb(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoText("📍 Lokasi:", "Sukabumi–Cianjur–Bogor, Jawa Barat"),
                infoText("⛰️ Ketinggian:", "2.958 mdpl"),
                infoText("🚶 Jalur Pendakian:",
                    "Cibodas, Gunung Putri, Selabintana"),
                infoText("⏱️ Waktu Tempuh:", "± 6–8 jam"),
                infoText("⚡ Tingkat Kesulitan:", "Menengah"),
                const SizedBox(height: 15),
                Text(
                  "Deskripsi:",
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Gunung Gede Pangrango merupakan bagian dari Taman Nasional Gede Pangrango "
                  "yang terletak di kawasan Sukabumi, Cianjur, dan Bogor. Gunung ini populer di kalangan pendaki "
                  "karena akses jalurnya yang cukup banyak, seperti Cibodas, Gunung Putri, dan Selabintana. "
                  "Salah satu daya tarik utama Gunung Gede adalah Alun-alun Suryakencana, padang luas yang dipenuhi "
                  "bunga edelweiss, serta pemandangan kawah aktif yang menakjubkan. "
                  "Waktu tempuh menuju puncak rata-rata 6–8 jam dengan tingkat kesulitan menengah. "
                  "Karena letaknya strategis dekat dengan Jabodetabek, gunung ini selalu ramai dan menjadi salah satu "
                  "destinasi favorit pendaki di Jawa Barat.",
                  style: GoogleFonts.istokWeb(fontSize: 15, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget infoText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title ",
              style: GoogleFonts.istokWeb(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: value,
              style: GoogleFonts.istokWeb(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
