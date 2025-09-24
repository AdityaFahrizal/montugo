import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rescue extends StatelessWidget {
  const Rescue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 69, 79), // charcoal
        title: Text(
          "Halaman Keselamatan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: const Keselamatan(),
    );
  }
}

class Keselamatan extends StatelessWidget {
  const Keselamatan({super.key});

  final List<Map<String, String>> data = const [
    {
      "title": "Persiapan Fisik & Mental",
      "desc":
          "Latihan fisik (jogging, bersepeda, naik tangga) akan meningkatkan stamina. Mental kuat membantu menghadapi lelah, takut, atau kondisi darurat."
    },
    {
      "title": "Navigasi & Peta Jalur",
      "desc":
          "Gunakan peta, aplikasi GPS offline, atau kompas. Jangan hanya mengandalkan orang lain agar risiko tersesat berkurang."
    },
    {
      "title": "Manajemen Waktu & Cuaca",
      "desc":
          "Mulai pagi hari agar aman sampai pos atau puncak sebelum gelap. Cuaca di gunung dinamis, cek prakiraan dan berhenti bila memburuk."
    },
    {
      "title": "Etika & Komunikasi Kelompok",
      "desc":
          "Mendaki bersama lebih aman. Gunakan tanda sederhana/peluit, jangan meninggalkan anggota yang kelelahan, utamakan keselamatan tim."
    },
    {
      "title": "Pertolongan Pertama (P3K)",
      "desc":
          "Bawa P3K lengkap: obat nyeri, betadine, perban, obat diare. Pengetahuan dasar P3K penting untuk mencegah cedera makin parah."
    },
    {
      "title": "Tindakan Saat Tersesat",
      "desc":
          "Jangan panik. Berhenti, buat tanda lokasi, gunakan peluit/senter, hubungi basecamp bila bisa, dan tunggu bantuan di satu titik."
    },
    {
      "title": "Bahaya Hipotermia",
      "desc":
          "Segera ganti pakaian basah, masuk sleeping bag, bungkus dengan emergency blanket, dan beri minuman hangat."
    },
    {
      "title": "Menghadapi Fauna Liar",
      "desc":
          "Hormati satwa liar. Jangan beri makan, simpan makanan rapat, dan hindari kontak langsung. Ingat, kita tamu di habitat mereka."
    },
    {
      "title": "Prosedur Evakuasi",
      "desc":
          "Hubungi basecamp atau SAR jika ada cedera parah. Jangan memaksakan evakuasi tanpa teknik benar. Jaga korban tetap hangat & aman."
    },
    {
      "title": "Nomor Darurat & Kontak Basecamp",
      "desc":
          "Catat nomor darurat basecamp sebelum mendaki. Simpan di ponsel & catatan fisik karena sinyal sering hilang."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return AnimatedSafetyCard(
          title: data[index]["title"]!,
          desc: data[index]["desc"]!,
          index: index + 1,
        );
      },
    );
  }
}

class AnimatedSafetyCard extends StatefulWidget {
  final String title;
  final String desc;
  final int index;

  const AnimatedSafetyCard({
    super.key,
    required this.title,
    required this.desc,
    required this.index,
  });

  @override
  State<AnimatedSafetyCard> createState() => _AnimatedSafetyCardState();
}

class _AnimatedSafetyCardState extends State<AnimatedSafetyCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => setState(() => _expanded = !_expanded),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFF36454F),
                    child: Text(
                      widget.index.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.istokWeb(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF36454F),
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black54),
                  ),
                ],
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    widget.desc,
                    style: GoogleFonts.istokWeb(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
                crossFadeState: _expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
