import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/categoryEquipment.dart';
import 'package:montugo/Screens/categoryMountain.dart';

class CategoryCatalog extends StatelessWidget {
  const CategoryCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Katalog Informasi",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 10),
          _buildCategoryCard(
            context,
            icon: Icons.filter_hdr_outlined,
            title: "Informasi Gunung",
            subtitle: "Jelajahi detail dan lokasi gunung-gunung di Indonesia.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Categorymountain()),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildCategoryCard(
            context,
            icon: Icons.backpack_outlined,
            title: "Peralatan Pendakian",
            subtitle: "Perlengkapan teknis untuk keamanan dan kenyamanan.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EquipmentListPage(jenis: "Peralatan")),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildCategoryCard(
            context,
            icon: Icons.fastfood_outlined,
            title: "Logistik Pendakian",
            subtitle: "Daftar makanan, minuman, dan kebutuhan dasar lainnya.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EquipmentListPage(jenis: "Logistik")),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 54, 69, 79),
                const Color.fromARGB(255, 68, 86, 99),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 45, color: Colors.white),
              const SizedBox(height: 15),
              Text(
                title,
                style: GoogleFonts.istokWeb(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: GoogleFonts.istokWeb(
                  fontSize: 15,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
