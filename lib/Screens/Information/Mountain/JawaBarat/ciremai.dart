import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CiremaiNav extends StatelessWidget {
  const CiremaiNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Gunung Ciremai",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Ciremai(),
    );
  }
}

class Ciremai extends StatelessWidget {
  const Ciremai({super.key});

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
              'assets/images/mountainImage/JawaBaratImage/ciremai.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          // Judul
          Text(
            "Gunung Ciremai",
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
                  "Lokasi: Kuningan & Majalengka, Jawa Barat"),
              infoItem(FontAwesomeIcons.mountain, "Ketinggian: 3.078 mdpl"),
              infoItem(FontAwesomeIcons.route,
                  "Jalur Pendakian: Apuy, Linggarjati, Palutungan, Linggasana"),
              infoItem(FontAwesomeIcons.clock, "Waktu Tempuh: ± 8–12 jam"),
              infoItem(FontAwesomeIcons.chartLine,
                  "Tingkat Kesulitan: Sulit – Menengah"),
              infoItem(FontAwesomeIcons.ticket,
                  "Tiket Masuk: 7.500(Senin - Jum'at) / 15.000 (Sabtu - Minggu / Libur)"),
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
            "Gunung Ciremai adalah gunung tertinggi di Jawa Barat dengan ketinggian 3.078 mdpl. "
            "Gunung ini termasuk gunung berapi aktif dan menjadi salah satu destinasi populer bagi pendaki "
            "yang mencari tantangan. Jalur yang terkenal adalah Apuy dan Linggarjati, dengan karakteristik "
            "pendakian yang cukup panjang dan menantang. Dari puncak, pendaki bisa menikmati panorama 360° "
            "yang memperlihatkan Gunung Slamet, Pangrango, Cikuray, hingga laut Jawa di kejauhan. "
            "Karena jalurnya panjang dan curam, Ciremai lebih cocok untuk pendaki yang sudah memiliki pengalaman.",
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
                initialCenter: LatLng(-6.892, 108.400),
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
                        point: LatLng(-6.892, 108.400),
                        child: Column(children: [
                          Icon(FontAwesomeIcons.mountain,
                              color: Color.fromARGB(255, 54, 69, 79)),
                          Text("Ciremai")
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
