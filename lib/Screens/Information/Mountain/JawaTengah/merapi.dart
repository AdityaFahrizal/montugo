import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MerapiNav extends StatelessWidget {
  const MerapiNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Gunung Merapi",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Merapi(),
    );
  }
}

class Merapi extends StatelessWidget {
  const Merapi({super.key});

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
              'assets/images/mountainImage/JawaTengahImage/merapii.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Gunung Merapi",
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
                  "Lokasi: Sleman (DIY) & Magelang, Boyolali, Klaten (Jawa Tengah)"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 2.930 mdpl"),
              infoItem(FontAwesomeIcons.route,
                  "Jalur Pendakian: Selo, Babadan, Kaliurang"),
              infoItem(FontAwesomeIcons.clock, "Waktu Tempuh: ± 4–6 jam"),
              infoItem(FontAwesomeIcons.chartLine,
                  "Tingkat Kesulitan: Menengah – Sulit"),
              infoItem(FontAwesomeIcons.ticket, "Tiket Masuk: 16.000"),
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
            "Gunung Merapi adalah salah satu gunung berapi paling aktif di Indonesia dan dunia, "
            "dengan ketinggian sekitar 2.930 mdpl. Merapi terkenal karena aktivitas vulkaniknya yang tinggi "
            "dan keindahan panorama dari puncaknya. Jalur Selo menjadi jalur favorit para pendaki karena aksesnya mudah "
            "dan jalurnya relatif jelas. Dari puncak Merapi, pendaki dapat menyaksikan pemandangan gunung-gunung lain "
            "seperti Merbabu, Sumbing, dan Sindoro. Meski jalurnya tidak terlalu panjang, medan curam dan kondisi cuaca "
            "yang cepat berubah membuat pendakian Merapi tetap menantang dan membutuhkan kewaspadaan tinggi.",
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
                initialCenter:
                    LatLng(-7.541, 110.446), // Koordinat Gunung Merapi
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                const MarkerLayer(
                  markers: [
                    Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(-7.541, 110.446),
                        child: Column(children: [
                          Icon(FontAwesomeIcons.mountain, color: Colors.red),
                          Text("Merapi")
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
