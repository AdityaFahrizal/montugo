import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SemeruNav extends StatelessWidget {
  const SemeruNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Gunung Semeru",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: const Semeru(),
    );
  }
}

class Semeru extends StatefulWidget {
  const Semeru({super.key});

  @override
  _SemeruState createState() => _SemeruState();
}

class _SemeruState extends State<Semeru> {
  final DocumentReference SemeruRef =
      FirebaseFirestore.instance.collection('gunung').doc('semeru');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: SemeruRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        ;
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('Data tidak ditemukan.'));
        }

        var data = snapshot.data!.data() as Map<String, dynamic>;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Utama
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  data['imageUrl'] ??
                      'assets/images/mountainImage/JawaTimurImage/semeru.jpg',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              // Judul
              Text(
                data['nama'] ?? '-',
                style: GoogleFonts.istokWeb(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: const Color.fromARGB(255, 54, 69, 79),
                ),
              ),
              const SizedBox(height: 8),

              Column(
                children: [
                  infoItem(FontAwesomeIcons.sign,
                      "Status: ${data['status'] ?? '-'}"),
                  infoItem(FontAwesomeIcons.mapMarkerAlt,
                      "Lokasi: ${data['lokasi'] ?? '-'}"),
                  infoItem(FontAwesomeIcons.mountain,
                      "Ketinggian: ${data['ketinggian'] ?? '-'}"),
                  infoItem(FontAwesomeIcons.route,
                      "Jalur Pendakian: ${data['jalur'] ?? '-'}"),
                  infoItem(FontAwesomeIcons.clock,
                      "Waktu Tempuh: ${data['waktu'] ?? '-'}"),
                  infoItem(FontAwesomeIcons.chartLine,
                      "Tingkat Kesulitan: ${data['kesulitan'] ?? '-'}"),
                  infoItem(FontAwesomeIcons.ticket,
                      "Tiket Masuk: ${data['tiket'] ?? '-'}"),
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
                data['deskripsi'] ?? '-',
                style: GoogleFonts.istokWeb(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

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
                    initialCenter: LatLng(data['latitude'] ?? -8.108,
                        data['longitude'] ?? 112.923),
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(data['latitude'] ?? -8.108,
                                data['longitude'] ?? 112.923),
                            child: const Column(children: [
                              Icon(FontAwesomeIcons.mountain,
                                  color: Color.fromARGB(255, 54, 69, 79)),
                              Text("Semeru")
                            ])),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class SemeruNav extends StatelessWidget {
//   const SemeruNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         title: Text(
//           "Gunung Semeru",
//           style: GoogleFonts.istokWeb(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: const Color.fromARGB(255, 0, 0, 0),
//           ),
//         ),
//       ),
//       body: const Semeru(),
//     );
//   }
// }

// class Semeru extends StatelessWidget {
//   const Semeru({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               'assets/images/mountainImage/JawaTimurImage/semeru.jpg',
//               height: 220,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Judul
//           Text(
//             "Gunung Semeru",
//             style: GoogleFonts.istokWeb(
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//               color: const Color.fromARGB(255, 54, 69, 79),
//             ),
//           ),
//           const SizedBox(height: 8),

//           // Informasi Ringkas
//           Column(
//             children: [
//               infoItem(FontAwesomeIcons.mapMarkerAlt,
//                   "Lokasi: Lumajang–Malang, Jawa Timur"),
//               infoItem(FontAwesomeIcons.mountain, "Ketinggian: 3.676 mdpl"),
//               infoItem(FontAwesomeIcons.route,
//                   "Jalur Pendakian: Ranu Pani – Ranu Kumbolo – Kalimati – Arcopodo"),
//               infoItem(
//                   FontAwesomeIcons.clock, "Waktu Tempuh: ± 2–3 hari pendakian"),
//               infoItem(FontAwesomeIcons.chartLine, "Tingkat Kesulitan: Tinggi"),
//               infoItem(FontAwesomeIcons.ticket,
//                   "Tiket Masuk: 20.000(Senin - Jum'at) / 30.000 (Sabtu - Minggu / Libur)"),
//             ],
//           ),
//           const SizedBox(height: 20),

//           // Deskripsi
//           Text(
//             "Deskripsi",
//             style: GoogleFonts.istokWeb(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: const Color.fromARGB(255, 54, 69, 79),
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             "Gunung Semeru adalah gunung tertinggi di Pulau Jawa dengan puncaknya, Mahameru, "
//             "mencapai ketinggian 3.676 mdpl. Jalur pendakian biasanya dimulai dari Ranu Pani, "
//             "melewati danau indah Ranu Kumbolo, lalu menuju Kalimati dan Arcopodo sebelum "
//             "melakukan summit attack ke puncak Mahameru. Gunung ini terkenal dengan letusan kecil "
//             "kawah Jonggring Saloka yang aktif setiap 20–30 menit. Pemandangan alam yang luar biasa "
//             "menjadikan Semeru salah satu tujuan favorit pendaki di Indonesia, meski jalurnya cukup berat "
//             "dan membutuhkan fisik serta persiapan matang.",
//             style: GoogleFonts.istokWeb(
//               fontSize: 15,
//               height: 1.6,
//               color: Colors.black87,
//             ),
//             textAlign: TextAlign.justify,
//           ),
//           const SizedBox(height: 20),

//           // Peta
//           Text(
//             "Peta Lokasi",
//             style: GoogleFonts.istokWeb(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: const Color.fromARGB(255, 54, 69, 79),
//             ),
//           ),
//           const SizedBox(height: 8),
//           SizedBox(
//             height: 300,
//             child: FlutterMap(
//               options: const MapOptions(
//                 initialCenter:
//                     LatLng(-8.108, 112.923), // Koordinat Gunung Semeru
//                 initialZoom: 13.0,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate:
//                       'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: const ['a', 'b', 'c'],
//                 ),
//                 const MarkerLayer(
//                   markers: [
//                     Marker(
//                         width: 80.0,
//                         height: 80.0,
//                         point: LatLng(-8.108, 112.923),
//                         child: Column(children: [
//                           Icon(FontAwesomeIcons.mountain,
//                               color: Color.fromARGB(255, 54, 69, 79)),
//                           Text("Semeru")
//                         ])),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget untuk baris info dengan icon
//   Widget infoItem(IconData icon, String text) {
//     return Card(
//       elevation: 2,
//       shadowColor: Colors.black26,
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         leading: Icon(icon, color: const Color.fromARGB(255, 54, 69, 79)),
//         title: Text(
//           text,
//           style: GoogleFonts.istokWeb(
//             fontSize: 15,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }
