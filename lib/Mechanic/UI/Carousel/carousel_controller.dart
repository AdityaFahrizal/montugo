import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:montugo/Screens/models/mountain_models.dart';
import 'dart:convert';
import 'dart:typed_data';

class CarouselControllerWidget extends StatelessWidget {
  const CarouselControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('gunung').limit(4).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return const SizedBox(
            height: 160,
            child: Center(child: Text("Gagal memuat data carousel")),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const SizedBox(height: 160);
        }

        var mountainDocs = snapshot.data!.docs;

        return CarouselSlider(
          items: mountainDocs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final mountainId = doc.id;

            final name = data['nama'] as String? ?? 'Nama tidak ada';
            final height =
                data['ketinggian'] as String? ?? 'Ketinggian tidak ada';
            final base64Image = data['image'] as String? ?? '';

            Widget imageWidget;
            if (base64Image.isNotEmpty) {
              try {
                final cleanBase64 = base64Image.split(',').last;
                final Uint8List decodedBytes = base64.decode(cleanBase64);
                imageWidget = Image.memory(
                  decodedBytes,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              } catch (e) {
                imageWidget = const Center(
                  child:
                      Icon(Icons.broken_image, color: Colors.white, size: 40),
                );
              }
            } else {
              imageWidget = const Center(
                child: Icon(Icons.image_not_supported,
                    color: Colors.white, size: 40),
              );
            }
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: imageWidget,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                height,
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 13,
                                ),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MountainDetailPage(
                                          mountainId: mountainId,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("Lihat Detail"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 160,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
        );
      },
    );
  }
}
