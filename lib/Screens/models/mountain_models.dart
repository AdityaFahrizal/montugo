import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

class MountainDetailPage extends StatelessWidget {
  final String mountainId;

  const MountainDetailPage({super.key, required this.mountainId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Detail Gunung",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: MountainDetail(mountainId: mountainId),
    );
  }
}

class MountainDetail extends StatefulWidget {
  final String mountainId;

  const MountainDetail({super.key, required this.mountainId});

  @override
  _MountainDetailState createState() => _MountainDetailState();
}

class _MountainDetailState extends State<MountainDetail> {
  late final DocumentReference mountainRef;

  @override
  void initState() {
    super.initState();
    mountainRef =
        FirebaseFirestore.instance.collection('gunung').doc(widget.mountainId);
  }

  // Helper function to safely parse coordinate values
  double _parseCoordinate(dynamic value, {required double defaultValue}) {
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value) ?? defaultValue;
    }
    return defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: mountainRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('Data tidak ditemukan.'));
        }

        var data = snapshot.data!.data() as Map<String, dynamic>;
        developer.log(
            'DATA DARI FIRESTORE UNTUK ID (${widget.mountainId}): $data',
            name: 'FirestoreDebug');

        final latitude =
            _parseCoordinate(data['latitude'], defaultValue: -8.108);
        final longitude =
            _parseCoordinate(data['longitude'], defaultValue: 112.923);
        final namaGunung = data['nama'] as String? ?? 'Nama tidak tersedia';

        Widget buildImage(String? base64String) {
          Widget placeholder = Container(
            height: 220,
            color: Colors.grey[300],
            child: const Center(
              child:
                  Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
            ),
          );

          if (base64String == null || base64String.isEmpty) {
            return placeholder;
          }

          try {
            final cleanBase64 = base64String.split(',').last;
            final Uint8List decodedBytes = base64.decode(cleanBase64);
            return Image.memory(
              decodedBytes,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                developer.log('Error rendering image from memory: $error',
                    name: 'ImageError');
                return placeholder;
              },
            );
          } catch (e) {
            developer.log('Could not decode base64 string: $e',
                name: 'ImageError');
            return placeholder;
          }
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: buildImage(data['image'] as String?),
              ),
              const SizedBox(height: 20),
              // Title
              Text(
                namaGunung,
                style: GoogleFonts.istokWeb(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: const Color.fromARGB(255, 54, 69, 79),
                ),
              ),
              const SizedBox(height: 8),

              Column(
                children: [
                  infoItem(FontAwesomeIcons.solidFlag,
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
                  infoItem(FontAwesomeIcons.ticketAlt,
                      "Tiket Masuk: ${data['tiket'] ?? '-'}"),
                ],
              ),
              const SizedBox(height: 20),
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
                data['deskripsi'] ?? 'Deskripsi tidak tersedia.',
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
                    initialCenter: LatLng(latitude, longitude),
                    initialZoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(latitude, longitude),
                            child: Column(children: [
                              const Icon(FontAwesomeIcons.mountain,
                                  color: Color.fromARGB(255, 54, 69, 79)),
                              Text(namaGunung,
                                  style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )
                              )
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
        leading:
            Icon(icon, color: const Color.fromARGB(255, 54, 69, 79), size: 20),
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
