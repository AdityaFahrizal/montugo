import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/models/mountain_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert'; 

class Categorymountain extends StatelessWidget {
  const Categorymountain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Gunung",
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
      body: const KategoriGunung(),
      backgroundColor: Colors.white, 
    );
  }
}

class KategoriGunung extends StatefulWidget {
  const KategoriGunung({super.key});

  @override
  State<KategoriGunung> createState() => _KategoriGunungState();
}

class _KategoriGunungState extends State<KategoriGunung> {
  String keyword = "";
  String? provinsiDipilih;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Cari gunung...",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    keyword = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),

            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('gunung').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Gagal memuat data"));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("Belum ada data gunung."));
                }

                var allMountains = snapshot.data!.docs;
                
                final provinsiList = allMountains
                    .map((doc) => (doc.data() as Map<String, dynamic>)['provinsi'] as String)
                    .toSet()
                    .toList();
                
                var filteredMountains = allMountains.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final cocokKeyword = data['nama']
                      .toLowerCase()
                      .contains(keyword.toLowerCase());
                  final cocokProvinsi = provinsiDipilih == null ||
                      data['provinsi'] == provinsiDipilih;
                  return cocokKeyword && cocokProvinsi;
                }).toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Filter Provinsi",
                                    style: GoogleFonts.istokWeb(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 54, 69, 79),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  ListTile(
                                    leading: const Icon(Icons.public, color: Color.fromARGB(255, 54, 69, 79)),
                                    title: const Text("Semua Provinsi"),
                                    onTap: () {
                                      setState(() {
                                        provinsiDipilih = null;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ...provinsiList.map((prov) => ListTile(
                                        leading: const Icon(Icons.terrain, color: Color.fromARGB(255, 54, 69, 79)),
                                        title: Text(prov),
                                        onTap: () {
                                          setState(() {
                                            provinsiDipilih = prov;
                                          });
                                          Navigator.pop(context);
                                        },
                                      )),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              provinsiDipilih ?? "Pilih Provinsi",
                              style: GoogleFonts.istokWeb(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 54, 69, 79),
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 54, 69, 79)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Column(
                      children: filteredMountains.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        final imageUrl = data['image'] as String? ?? ''; 
                        final nama = data['nama'] as String? ?? 'Nama tidak tersedia';
                        final tinggi = data['ketinggian'] as String? ?? 'Data tidak tersedia';
                        
                        return buildMountainCard(
                          context,
                          title: nama,
                          height: tinggi,
                          base64Image: imageUrl, 
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MountainDetailPage(mountainId: doc.id),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget buildMountainCard(
    BuildContext context, {
    required String title,
    required String height,
    required String base64Image, 
    required VoidCallback onPressed,
  }) {
    Widget imageWidget;
    if (base64Image.isNotEmpty) {
      try {
        final cleanBase64 = base64Image.split(',').last;
        final imageBytes = base64.decode(cleanBase64);
        imageWidget = Image.memory(
          imageBytes,
          width: double.infinity,
          height: 139,
          fit: BoxFit.cover,
        );
      } catch (e) {
        imageWidget = Container(
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, color: Colors.grey, size: 50),
        );
      }
    } else {
      imageWidget = Container(
        color: Colors.grey[300],
        child: const Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 19),
      width: double.infinity,
      height: 139,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: imageWidget, 
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  height,
                  style: GoogleFonts.istokWeb(
                    fontSize: 14,
                    color: Colors.amber,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    onPressed: onPressed,
                    child: const Text("Lihat Detail"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
