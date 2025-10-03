import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/Information/Logistic/emergencyblanket.dart';
import 'package:montugo/Screens/Information/Logistic/raincoat.dart';
import 'package:montugo/Screens/Information/Logistic/sleepingbag.dart';
import 'package:montugo/Screens/Information/Logistic/tent.dart';

class CategoryLogistic extends StatefulWidget {
  const CategoryLogistic({super.key});

  @override
  State<CategoryLogistic> createState() => _CategoryLogisticState();
}

class _CategoryLogisticState extends State<CategoryLogistic> {
  String searchQuery = "";
  String selectedFilter = "Semua";

  final List<Map<String, dynamic>> logistics = [
    {
      "name": "Emergency Blanket",
      "image": "assets/images/logisticImage/emergency.jpg",
      "page": const Emergencyblanket(),
      "category": "Pelindung",
    },
    {
      "name": "Sleeping Bag",
      "image": "assets/images/logisticImage/Sleeping.jpg",
      "page": const Sleepingbag(),
      "category": "Tidur",
    },
    {
      "name": "Tenda",
      "image": "assets/images/logisticImage/tenda.jpg",
      "page": const Tenda(),
      "category": "Tidur",
    },
    {
      "name": "Jas Hujan",
      "image": "assets/images/logisticImage/poncho.png",
      "page": const JasHujan(),
      "category": "Pelindung",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredLogistics = logistics.where((item) {
      final matchesSearch = item["name"]
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
      final matchesFilter =
          selectedFilter == "Semua" || item["category"] == selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Logistik",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          // 🔍 Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
              decoration: InputDecoration(
                hintText: "Cari di sini...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 🏷️ Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip("Semua"),
                const SizedBox(width: 8),
                _buildFilterChip("Pelindung"),
                const SizedBox(width: 8),
                _buildFilterChip("Tidur"),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 📦 Grid Logistic
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredLogistics.length,
              itemBuilder: (context, index) {
                final item = filteredLogistics[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item["page"]),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 54, 69, 79),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.asset(
                            item["image"],
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item["name"],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Widget Filter Chip
  Widget _buildFilterChip(String label) {
    final isSelected = selectedFilter == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {
        setState(() => selectedFilter = label);
      },
      selectedColor: Colors.blueGrey,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}
