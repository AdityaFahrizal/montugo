import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/Information/Equipment/carrierBag.dart';
import 'package:montugo/Screens/Information/Equipment/gorpcore.dart';
import 'package:montugo/Screens/Information/Equipment/shoes.dart';
import 'package:montugo/Screens/Information/Equipment/trackingPole.dart';

class Categoryequipment extends StatefulWidget {
  const Categoryequipment({super.key});

  @override
  State<Categoryequipment> createState() => _CategoryequipmentState();
}

class _CategoryequipmentState extends State<Categoryequipment> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  final List<Map<String, dynamic>> equipmentItems = [
    {
      "title": "Trekking Pole",
      "image": "assets/images/equipmentImage/Pole.png",
      "page": const TrekkingPoleNav(),
    },
    {
      "title": "Jaket Gunung",
      "image": "assets/images/equipmentImage/Gorpcore.jpg",
      "page": const JaketGunung(),
    },
    {
      "title": "Tas Carrier",
      "image": "assets/images/equipmentImage/carrier.jpg",
      "page": const TasCarrierNav(),
    },
    {
      "title": "Sepatu Gunung",
      "image": "assets/images/equipmentImage/sepatu.jpg",
      "page": const SepatuGunungNav(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = equipmentItems.where((item) {
      return item["title"]
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Peralatan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 🔎 Search Bar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() => searchQuery = value);
                  },
                  decoration: const InputDecoration(
                    hintText: "Cari di sini...",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 📦 Grid Items
            filteredItems.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                      childAspectRatio: 171 / 140,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => item["page"]),
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            // 🔳 Background Card
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 54, 69, 79),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    blurRadius: 4,
                                    offset: const Offset(0, 5),
                                    spreadRadius: 0.5,
                                  ),
                                ],
                              ),
                            ),
                            // 🖼️ Gambar
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(item["image"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // 📝 Text
                            Positioned(
                              top: 110,
                              left: 12,
                              child: Text(
                                item["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text("Data tidak ditemukan"),
                  ),
          ],
        ),
      ),
    );
  }
}
