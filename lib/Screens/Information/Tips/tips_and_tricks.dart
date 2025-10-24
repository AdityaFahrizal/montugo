import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/Information/Rescue/rescue.dart';

class TipsAndTricks extends StatelessWidget {
  const TipsAndTricks({super.key});

  final List<Map<String, dynamic>> tipsData = const [
    {
      "icon": Icons.fitness_center,
      "title": "Persiapan Fisik & Mental",
      "desc": "Latihan fisik akan meningkatkan stamina. Mental kuat membantu menghadapi kondisi darurat."
    },
    {
      "icon": Icons.navigation,
      "title": "Navigasi & Peta Jalur",
      "desc": "Gunakan peta, aplikasi GPS offline, atau kompas. Jangan hanya mengandalkan orang lain."
    },
    {
      "icon": Icons.wb_sunny,
      "title": "Manajemen Waktu & Cuaca",
      "desc": "Mulai mendaki pagi hari. Selalu cek prakiraan cuaca sebelum berangkat."
    },
    {
      "icon": Icons.medical_services,
      "title": "Pertolongan Pertama (P3K)",
      "desc": "Bawa P3K lengkap. Pengetahuan dasar P3K sangat penting untuk keadaan darurat."
    },
    {
      "icon": Icons.help_outline,
      "title": "Tindakan Saat Tersesat",
      "desc": "Jangan panik. Berhenti, buat tanda, dan tunggu bantuan di satu titik."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tips & Trik Mendaki",
                style: GoogleFonts.istokWeb( 
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF36454F),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Rescue()),
                  );
                },
                child: Text(
                  "Lihat Semua",
                  style: GoogleFonts.istokWeb( 
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF36454F),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 5),
            itemCount: tipsData.length,
            itemBuilder: (context, index) {
              return TipCard(
                icon: tipsData[index]['icon'] as IconData,
                title: tipsData[index]['title']! as String,
                desc: tipsData[index]['desc']! as String,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const TipCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF36454F), size: 30),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.istokWeb( 
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: const Color(0xFF36454F),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: GoogleFonts.istokWeb( 
              fontSize: 12,
              color: Colors.black54,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
