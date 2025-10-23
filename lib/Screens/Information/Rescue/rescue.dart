import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rescue extends StatelessWidget {
  const Rescue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          "Informasi Keselamatan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 2,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
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
      "icon": Icons.map_outlined,
      "title": "Navigasi & Peta Jalur",
      "desc":
          "Gunakan peta, aplikasi GPS offline, atau kompas. Jangan hanya mengandalkan orang lain agar risiko tersesat berkurang."
    },
    {
      "icon": Icons.access_time_outlined,
      "title": "Manajemen Waktu & Cuaca",
      "desc":
          "Mulai pagi hari agar aman sampai pos atau puncak sebelum gelap. Cuaca di gunung dinamis, cek prakiraan dan berhenti bila memburuk."
    },
    {
      "icon": Icons.group_outlined,
      "title": "Etika & Komunikasi Kelompok",
      "desc":
          "Mendaki bersama lebih aman. Gunakan tanda sederhana/peluit, jangan meninggalkan anggota yang kelelahan, utamakan keselamatan tim."
    },
    {
      "icon": Icons.medical_services_outlined,
      "title": "Pertolongan Pertama (P3K)",
      "desc":
          "Bawa P3K lengkap: obat nyeri, betadine, perban, obat diare. Pengetahuan dasar P3K penting untuk mencegah cedera makin parah."
    },
    {
      "icon": Icons.help_outline_rounded,
      "title": "Tindakan Saat Tersesat",
      "desc":
          "Jangan panik. Berhenti, buat tanda lokasi, gunakan peluit/senter, hubungi basecamp bila bisa, dan tunggu bantuan di satu titik."
    },
    {
      "icon": Icons.ac_unit_outlined,
      "title": "Bahaya Hipotermia",
      "desc":
          "Segera ganti pakaian basah, masuk sleeping bag, bungkus dengan emergency blanket, dan beri minuman hangat."
    },
    {
      "icon": Icons.pets_outlined,
      "title": "Menghadapi Fauna Liar",
      "desc":
          "Hormati satwa liar. Jangan beri makan, simpan makanan rapat, dan hindari kontak langsung. Ingat, kita tamu di habitat mereka."
    },
    {
      "icon": Icons.support_agent_outlined,
      "title": "Prosedur Evakuasi",
      "desc":
          "Hubungi basecamp atau SAR jika ada cedera parah. Jangan memaksakan evakuasi tanpa teknik benar. Jaga korban tetap hangat & aman."
    },
    {
      "icon": Icons.phone_in_talk_outlined,
      "title": "Nomor Darurat & Kontak Basecamp",
      "desc":
          "Catat nomor darurat basecamp sebelum mendaki. Simpan di ponsel & catatan fisik karena sinyal sering hilang."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      itemCount: data.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return SafetyInfoCard(
          icon: data[index]['icon']! as IconData,
          title: data[index]['title']! as String,
          desc: data[index]['desc']! as String,
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF36454F), size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF36454F),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    fontSize: 14.5,
                    color: Colors.black.withOpacity(0.7),
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
