import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rescue extends StatelessWidget {
  const Rescue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF36454F), // Charcoal
        title: Text(
          "Informasi Keselamatan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: const Keselamatan(),
    );
  }
}

class Keselamatan extends StatelessWidget {
  const Keselamatan({super.key});

  final List<Map<String, dynamic>> data = const [
    {
      "icon": Icons.fitness_center,
      "title": "Persiapan Fisik & Mental",
      "desc":
          "Latihan fisik (jogging, bersepeda, naik tangga) akan meningkatkan stamina. Mental kuat membantu menghadapi lelah, takut, atau kondisi darurat."
    },
    {
      "icon": Icons.map,
      "title": "Navigasi & Peta Jalur",
      "desc":
          "Gunakan peta, aplikasi GPS offline, atau kompas. Jangan hanya mengandalkan orang lain agar risiko tersesat berkurang."
    },
    {
      "icon": Icons.access_time,
      "title": "Manajemen Waktu & Cuaca",
      "desc":
          "Mulai pagi hari agar aman sampai pos atau puncak sebelum gelap. Cuaca di gunung dinamis, cek prakiraan dan berhenti bila memburuk."
    },
    {
      "icon": Icons.group,
      "title": "Etika & Komunikasi Kelompok",
      "desc":
          "Mendaki bersama lebih aman. Gunakan tanda sederhana/peluit, jangan meninggalkan anggota yang kelelahan, utamakan keselamatan tim."
    },
    {
      "icon": Icons.medical_services,
      "title": "Pertolongan Pertama (P3K)",
      "desc":
          "Bawa P3K lengkap: obat nyeri, betadine, perban, obat diare. Pengetahuan dasar P3K penting untuk mencegah cedera makin parah."
    },
    {
      "icon": Icons.help_outline,
      "title": "Tindakan Saat Tersesat",
      "desc":
          "Jangan panik. Berhenti, buat tanda lokasi, gunakan peluit/senter, hubungi basecamp bila bisa, dan tunggu bantuan di satu titik."
    },
    {
      "icon": Icons.ac_unit,
      "title": "Bahaya Hipotermia",
      "desc":
          "Segera ganti pakaian basah, masuk sleeping bag, bungkus dengan emergency blanket, dan beri minuman hangat."
    },
    {
      "icon": Icons.pets,
      "title": "Menghadapi Fauna Liar",
      "desc":
          "Hormati satwa liar. Jangan beri makan, simpan makanan rapat, dan hindari kontak langsung. Ingat, kita tamu di habitat mereka."
    },
    {
      "icon": Icons.support,
      "title": "Prosedur Evakuasi",
      "desc":
          "Hubungi basecamp atau SAR jika ada cedera parah. Jangan memaksakan evakuasi tanpa teknik benar. Jaga korban tetap hangat & aman."
    },
    {
      "icon": Icons.phone,
      "title": "Nomor Darurat & Kontak Basecamp",
      "desc":
          "Catat nomor darurat basecamp sebelum mendaki. Simpan di ponsel & catatan fisik karena sinyal sering hilang."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return SafetyInfoCard(
          icon: data[index]['icon'],
          title: data[index]['title'],
          desc: data[index]['desc'],
        );
      },
    );
  }
}

class SafetyInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const SafetyInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF36454F), size: 32),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color(0xFF36454F),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  desc,
                  style: GoogleFonts.istokWeb(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
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
