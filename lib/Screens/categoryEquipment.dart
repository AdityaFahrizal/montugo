import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:montugo/Screens/models/equipment_models.dart';

class EquipmentListPage extends StatelessWidget {
  final String jenis;
  const EquipmentListPage({required this.jenis, super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Daftar $jenis";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('barang')
            .where('jenis', isEqualTo: jenis)
            .orderBy('kategori')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "Belum ada $jenis yang ditambahkan.",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          var documents = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              var doc = documents[index];
              var data = doc.data() as Map<String, dynamic>;
              final barangId = doc.id;

              Widget imageWidget = Container(
                width: 100,
                height: 100,
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported,
                    color: Colors.grey, size: 40),
              );

              if (data.containsKey('image') &&
                  data['image'] != null &&
                  (data['image'] as String).isNotEmpty) {
                try {
                  final cleanBase64 = (data['image'] as String).split(',').last;
                  final Uint8List decodedBytes = base64.decode(cleanBase64);
                  imageWidget = Image.memory(
                    decodedBytes,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                } catch (e) {}
              }

              bool showHeader = false;
              if (index == 0) {
                showHeader = true;
              } else {
                var prevData =
                    documents[index - 1].data() as Map<String, dynamic>;
                if (data['kategori'] != prevData['kategori']) {
                  showHeader = true;
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showHeader)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: Text(
                        data['kategori'] ?? 'Lainnya',
                        style: GoogleFonts.istokWeb(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 54, 69, 79),
                        ),
                      ),
                    ),
                  Card(
                    color: Colors.white,
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EquipmentDetailPage(barangId: barangId),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: imageWidget,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['nama'] ?? 'Nama tidak tersedia',
                                    style: GoogleFonts.istokWeb(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    data['deskripsi'] ??
                                        'Deskripsi tidak tersedia',
                                    style: GoogleFonts.istokWeb(
                                        fontSize: 14, color: Colors.black54),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
