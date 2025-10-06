import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PapandayanNav extends StatelessWidget {
  const PapandayanNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Gunung Papandayan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Papandayan(),
    );
  }
}

class Papandayan extends StatelessWidget {
  const Papandayan({super.key});

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
              'assets/images/mountainImage/JawaBaratImage/Papandayan.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Gunung Papandayan",
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
              infoItem(
                  FontAwesomeIcons.mapMarkerAlt, "Lokasi: Garut, Jawa Barat"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 2.665 mdpl"),
              infoItem(FontAwesomeIcons.route, "Jalur Pendakian: Cisurupan"),
              infoItem(FontAwesomeIcons.clock, "Waktu Tempuh: ± 4–5 jam"),
              infoItem(FontAwesomeIcons.chartLine,
                  "Tingkat Kesulitan: Mudah – Menengah"),
              infoItem(FontAwesomeIcons.ticket, "Tiket Masuk: 30.000 - 40.000"),
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
            "Gunung Papandayan dikenal sebagai salah satu gunung yang ramah untuk pendaki pemula. "
            "Dengan jalur utama di Cisurupan, pendaki hanya membutuhkan sekitar 4–5 jam perjalanan "
            "untuk mencapai puncak. Keunikan Papandayan terletak pada kawah aktifnya yang mengeluarkan "
            "asap belerang, serta hutan mati yang menjadi spot foto ikonik. Tak jauh dari jalur pendakian, "
            "terdapat Tegal Alun, padang edelweiss luas yang sering disebut sebagai “surga bunga abadi.” "
            "Jalur Papandayan relatif mudah dengan medan yang landai, sehingga cocok untuk pendaki pemula "
            "maupun pendaki berpengalaman yang ingin menikmati keindahan alam tanpa trek terlalu berat.",
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
              options: MapOptions(
                initialCenter:
                    LatLng(-7.32, 107.73), // Koordinat Gunung Papandayan
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(-7.32, 107.73),
                        child: Column(children: [
                          Icon(FontAwesomeIcons.mountain,
                              color: const Color.fromARGB(255, 54, 69, 79)),
                          Text("Papandayan")
                        ])),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
