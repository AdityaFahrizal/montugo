import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTengah/merapi.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTengah/sindoro.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTimur/bromo.dart';

class CarouselControllerWidget extends StatefulWidget {
  const CarouselControllerWidget({super.key});

  @override
  State<CarouselControllerWidget> createState() =>
      _CarouselControllerWidgetState();
}

class _CarouselControllerWidgetState extends State<CarouselControllerWidget> {
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

  void navigateToMountainDetail(String mountainName) {
    Widget? destination;
    if (mountainName == "MT. Sindoro") {
      destination = const SindoroNav();
    } else if (mountainName == "MT. Merapi") {
      destination = const MerapiNav();
    } else if (mountainName == "MT. Bromo") {
      destination = const BromoNav();
    }

    if (destination != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination!),
      );
    }
  }

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
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Icon(Icons.broken_image,
                                  color: Colors.white));
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
                            mountain["name"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            mountain["height"]!,
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
                                navigateToMountainDetail(mountain["name"]!);
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
            height: 160,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            aspectRatio: 1.91 / 1,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}
