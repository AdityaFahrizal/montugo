import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _editPop(context),
            ),
          ]),
      body: const Ciremai(),
    );
  }
}

class Ciremai extends StatefulWidget {
  const Ciremai({super.key});

  @override
  _CiremaiState createState() => _CiremaiState();
}

class _CiremaiState extends State<Ciremai> {
  final DocumentReference ciremaiRef =
      FirebaseFirestore.instance.collection('gunung').doc('ciremai');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: ciremaiRef.snapshots(),
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
                    initialCenter: LatLng(data['latitude'] ?? -6.892,
                        data['longitude'] ?? 108.400),
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
                            point: LatLng(data['latitude'] ?? -6.892,
                                data['longitude'] ?? 108.400),
                            child: const Column(children: [
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

void _editPop(BuildContext context) {
  final DocumentReference ciremaiRef =
      FirebaseFirestore.instance.collection('gunung').doc('ciremai');

  final statusController = TextEditingController();
  final lokasiController = TextEditingController();
  final ketinggianController = TextEditingController();
  final jalurController = TextEditingController();
  final waktuController = TextEditingController();
  final kesulitanController = TextEditingController();
  final tiketController = TextEditingController();
  final deskripsiController = TextEditingController();

  ciremaiRef.get().then((doc) {
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      statusController.text = doc['status'] ?? ' ';
      lokasiController.text = doc['lokasi'] ?? '';
      ketinggianController.text = doc['ketinggian'] ?? '';
      jalurController.text = doc['jalur'] ?? '';
      waktuController.text = doc['waktu'] ?? '';
      kesulitanController.text = doc['kesulitan'] ?? '';
      tiketController.text = doc['tiket'] ?? '';
      deskripsiController.text = doc['deskripsi'] ?? '';
    }
  });

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: statusController,
                decoration: const InputDecoration(labelText: 'Status')),
            TextField(
                controller: lokasiController,
                decoration: const InputDecoration(labelText: 'Lokasi')),
            TextField(
                controller: ketinggianController,
                decoration: const InputDecoration(labelText: 'Ketinggian')),
            TextField(
                controller: jalurController,
                decoration: const InputDecoration(labelText: 'Jalur')),
            TextField(
                controller: waktuController,
                decoration: const InputDecoration(labelText: 'Waktu Tempuh')),
            TextField(
                controller: kesulitanController,
                decoration:
                    const InputDecoration(labelText: 'Tingkat Kesulitan')),
            TextField(
                controller: tiketController,
                decoration: const InputDecoration(labelText: 'Tiket Masuk')),
            TextField(
                controller: deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi')),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ciremaiRef.update({
                      'status': statusController.text,
                      'lokasi': lokasiController.text,
                      'ketinggian': ketinggianController.text,
                      'jalur': jalurController.text,
                      'waktu': waktuController.text,
                      'kesulitan': kesulitanController.text,
                      'tiket': tiketController.text,
                      'deskripsi': deskripsiController.text,
                    }).then((_) => Navigator.pop(context));
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
