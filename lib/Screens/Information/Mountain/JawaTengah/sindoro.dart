import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class Sindoro extends StatefulWidget {
  const Sindoro({super.key});

  @override
  _SindoroState createState() => _SindoroState();
}

class _SindoroState extends State<Sindoro> {
  final DocumentReference SindoroRef =
      FirebaseFirestore.instance.collection('gunung').doc('sindoro');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: SindoroRef.snapshots(),
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
                      'assets/images/mountainImage/JawaTengahImage/Sindoroo.jpg',
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
                    initialCenter: LatLng(data['latitude'] ?? -7.295,
                        data['longitude'] ?? 109.993),
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
                            point: LatLng(data['latitude'] ?? -7.295,
                                data['longitude'] ?? 109.993),
                            child: const Column(children: [
                              Icon(FontAwesomeIcons.mountain,
                                  color: Color.fromARGB(255, 54, 69, 79)),
                              Text("Gede")
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

