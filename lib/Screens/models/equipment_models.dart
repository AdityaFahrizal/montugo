import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:developer' as developer;

class EquipmentDetailPage extends StatelessWidget {
  final String barangId;

  const EquipmentDetailPage({super.key, required this.barangId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Peralatan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('barang') 
            .doc(barangId) 
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("Data tidak ditemukan."));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;

          Widget buildImage(String? base64String) {
            Widget placeholder = Container(
                height: 250,
                color: Colors.grey[200],
                child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50)));

            if (base64String == null || base64String.isEmpty) {
              return placeholder;
            }
            try {
              final cleanBase64 = base64String.split(',').last;
              final Uint8List decodedBytes = base64.decode(cleanBase64);
              return Image.memory(
                decodedBytes,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  developer.log('Error rendering image from memory: $error', name: 'ImageError');
                  return placeholder;
                },
              );
            } catch (e) {
              developer.log('Could not decode base64 string: $e', name: 'ImageError');
              return placeholder;
            }
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: buildImage(data['image'] as String?),
                ),
                const SizedBox(height: 20),
                Text(
                  data['nama'] ?? 'Nama tidak tersedia',
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 54, 69, 79),
                  ),
                ),
                const SizedBox(height: 10),
                _buildInfoCard(data),
                const SizedBox(height: 20),
                Text(
                  "Deskripsi",
                  style: GoogleFonts.istokWeb(
                      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Text(
                  data['deskripsi'] ?? 'Deskripsi tidak tersedia.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.istokWeb(fontSize: 15, height: 1.6, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(Map<String, dynamic> data) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.category_outlined, "Kategori", data['kategori'] ?? '-'),
            _buildInfoRow(Icons.scale_outlined, "Berat", data['berat'] ?? '-'),
            _buildInfoRow(Icons.paid_outlined, "Harga", data['harga'] ?? '-'),
            _buildInfoRow(Icons.texture_outlined, "Bahan", data['bahan'] ?? '-'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 54, 69, 79), size: 22),
          const SizedBox(width: 15),
          Text(
            "$label:",
            style: GoogleFonts.istokWeb(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: GoogleFonts.istokWeb(fontSize: 15, color: Colors.black54),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
