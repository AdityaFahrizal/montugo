import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:montugo/Screens/models/mountain_models.dart';

class CarouselControllerWidget extends StatelessWidget {
  const CarouselControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // Ambil data dari koleksi 'gunung', limit 3 untuk carousel
      stream: FirebaseFirestore.instance.collection('gunung').limit(3).snapshots(),
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
          return const SizedBox(height: 160); // Tampilkan kosong jika tidak ada data
        }

        var mountainDocs = snapshot.data!.docs;

        return CarouselSlider(
          items: mountainDocs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final mountainId = doc.id; // Ini adalah ID dokumen dari Firestore

            // Ambil data dengan fallback default jika ada yang null
            final name = data['nama'] as String? ?? 'Nama tidak ada';
            final height = data['ketinggian'] as String? ?? 'Ketinggian tidak ada';
            final imagePath = data['image'] as String? ?? 'assets/images/JawaBarat.jpg'; // Pastikan field ini ada di firestore

            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        // Gambar background dari asset
                        Positioned.fill(
                          child: Image.asset(
                            imagePath, 
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(Icons.broken_image, color: Colors.white),
                              );
                            },
                          ),
                        ),

                        // Overlay gradient
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

                        // Teks dan tombol
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

                              // Tombol "See details"
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
                                    // Navigasi ke halaman detail dinamis dengan ID gunung
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MountainDetailPage(
                                          mountainId: mountainId,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("See details"),
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
