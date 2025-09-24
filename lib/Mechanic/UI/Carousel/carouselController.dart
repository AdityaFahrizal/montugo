import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carouselcontroller extends StatefulWidget {
  const Carouselcontroller({super.key});

  @override
  State<Carouselcontroller> createState() => _CarouselcontrollerState();
}

class _CarouselcontrollerState extends State<Carouselcontroller> {
  final List<Map<String, String>> mountains = [
    {
      "name": "MT. Sindoro",
      "height": "3450 Mdpl",
      "image":
          "https://cdn.pixabay.com/photo/2018/10/28/09/56/mountains-3778244_1280.jpg"
    },
    {
      "name": "MT. Merapi",
      "height": "2930 Mdpl",
      "image":
          "https://cdn.pixabay.com/photo/2018/10/28/16/11/volcano-3779159_1280.jpg"
    },
    {
      "name": "MT. Bromo",
      "height": "2329 Mdpl",
      "image":
          "https://media.istockphoto.com/id/494386476/id/foto/matahari-terbit-di-gunung-bromo.jpg?b=1&s=612x612&w=0&k=20&c=oZdFwq-jJ1HoMcxzO-IyXbvbo_nKkKQfk9aWs2LbrsI="
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: mountains.map((mountain) {
            return Container(
              margin: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    // Gambar background
                    Positioned.fill(
                      child: Image.network(
                        mountain["image"]!,
                        fit: BoxFit.cover,
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
                            mountain["name"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            mountain["height"]!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
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
                                // Aksi klik
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Detail ${mountain["name"]} ditekan"),
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
          }).toList(),
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}
