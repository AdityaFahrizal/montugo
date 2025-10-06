import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SindoroNav extends StatelessWidget {
  const SindoroNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Gunung Sindoro",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Sindoro(),
    );
  }
}

class Sindoro extends StatelessWidget {
  const Sindoro({super.key});

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
              'assets/images/mountainImage/JawaTengahImage/Sindoroo.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          Text(
            "Gunung Sindoro",
            style: GoogleFonts.istokWeb(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: const Color.fromARGB(255, 54, 69, 79),
            ),
          ),
          const SizedBox(height: 8),

          Column(
            children: [
              infoItem(FontAwesomeIcons.mapMarkerAlt,
                  "Lokasi: Wonosobo & Temanggung, Jawa Tengah"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 3.150 mdpl"),
              infoItem(FontAwesomeIcons.route,
                  "Jalur Pendakian: Kledung, Alang-alang Sewu, Bansari"),
              infoItem(FontAwesomeIcons.clock, "Waktu Tempuh: ± 6–8 jam"),
              infoItem(FontAwesomeIcons.chartLine, "Tingkat Kesulitan: Menengah – Sulit"),
              infoItem(FontAwesomeIcons.ticket, "Tiket Masuk: 30.000 - 35.000"),
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
            "Gunung Sindoro merupakan gunung berapi aktif yang berdiri megah berdampingan dengan Gunung Sumbing. "
            "Dengan ketinggian 3.150 mdpl, Sindoro menawarkan panorama alam yang memukau, termasuk lautan awan "
            "dan sunrise yang terkenal indah. Jalur Kledung menjadi jalur favorit karena aksesnya mudah dan trek "
            "yang jelas, meskipun tetap menantang dengan tanjakan terjal menjelang puncak. "
            "Di puncaknya, pendaki bisa menyaksikan kawah luas dengan aktivitas vulkanik berupa asap belerang, "
            "serta pemandangan gunung-gunung lain di sekitarnya seperti Merbabu, Merapi, dan Slamet.",
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
                initialCenter: LatLng(-7.295, 109.993), // Koordinat Gunung Sindoro
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(-7.295, 109.993),
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.mountain, color: Colors.red),
                          Text("Sindoro")
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
