import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GedeNav extends StatelessWidget {
  const GedeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // background putih
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // putih
        title: Text(
          "Gunung Gede",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Utama
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/mountainImage/JawaBaratImage/Gede.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Gunung Gede Pangrango",
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
                  "Lokasi: Sukabumi–Cianjur–Bogor, Jawa Barat"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 2.958 mdpl"),
              infoItem(FontAwesomeIcons.route,
                  "Jalur Pendakian: Cibodas, Gunung Putri, Selabintana"),
              infoItem(FontAwesomeIcons.clock, "Waktu Tempuh: ± 6–8 jam"),
              infoItem(FontAwesomeIcons.chartLine,
                  "Tingkat Kesulitan: Menengah – Tinggi"),
              infoItem(FontAwesomeIcons.ticket,
                  "Tiket Masuk: 72.000(Senin - Jum'at) / 92.000 (Sabtu - Minggu / Libur)"),
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
            "Gunung Gede Pangrango merupakan salah satu gunung paling populer di Jawa Barat, "
            "berada dalam kawasan Taman Nasional Gunung Gede Pangrango. Gunung ini memiliki "
            "dua puncak utama, yaitu Puncak Gede dan Puncak Pangrango. Jalur pendakian yang "
            "paling terkenal adalah Cibodas, Gunung Putri, dan Selabintana, dengan waktu tempuh "
            "sekitar 6–8 jam menuju puncak. Sepanjang jalur, pendaki dapat menikmati keindahan "
            "air terjun, alun-alun surya kencana yang luas dengan hamparan bunga edelweiss, serta "
            "pemandangan kawah aktif. Tingkat kesulitannya cukup menantang, cocok untuk pendaki "
            "berpengalaman maupun mereka yang ingin menguji kemampuan fisik dan mental.",
            style: GoogleFonts.istokWeb(
              fontSize: 15,
              height: 1.6,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),

          // Peta
          Text(
            "Peta Lokasi",
            style: GoogleFonts.istokWeb(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color.fromARGB(255, 54, 69, 79),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(-6.78, 106.97), // Koordinat Gunung Gede
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                const MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(-6.78, 106.97),
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.mountain, color: Colors.red),
                          Text("Gede")
                        ]
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
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
