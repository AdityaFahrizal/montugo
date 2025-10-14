import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Map<String, dynamic>> faqData = [
  {
    "icon": Icons.phone_android_outlined,
    "q": "Apa itu aplikasi MONTUGO?",
    "a":
        "MONTUGO adalah aplikasi mobile yang didesain sebagai teman perjalanan Anda untuk mendaki gunung di Indonesia, menyediakan informasi, edukasi, dan fitur pendukung lainnya."
  },
  {
    "icon": Icons.featured_play_list_outlined,
    "q": "Apa saja fitur utama MONTUGO?",
    "a":
        "Fitur utama kami meliputi:\n• Informasi Detail Gunung: Jalur, lokasi, ketinggian, dan cuaca.\n• Katalog Perlengkapan: Rekomendasi alat-alat pendakian.\n• Edukasi & Keselamatan: Tips keamanan, panduan P3K, dan prinsip-prinsip pendakian yang bertanggung jawab."
  },
  {
    "icon": Icons.shopping_cart_outlined,
    "q": "Apakah perlengkapan di katalog bisa dibeli?",
    "a":
        "Tidak. Untuk saat ini, katalog hanya berfungsi sebagai referensi dan checklist rekomendasi. Kami tidak melayani transaksi jual beli."
  },
  {
    "icon": Icons.escalator_warning_outlined,
    "q": "Apakah aplikasi ini cocok untuk pendaki pemula?",
    "a":
        "Sangat cocok. MONTUGO dirancang dengan antarmuka yang sederhana agar pendaki pemula dapat dengan mudah memahami informasi esensial seperti jalur pendakian, perlengkapan wajib, dan panduan keselamatan dasar."
  },
  {
    "icon": Icons.eco_outlined,
    "q": "Apa itu prinsip Leave No Trace?",
    "a":
        "Leave No Trace adalah etika pendakian untuk menjaga kelestarian alam. Prinsip utamanya adalah: bawa kembali semua sampah, jangan merusak tanaman, jangan mengganggu satwa liar, dan hormati alam sekitar Anda."
  },
];

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), 
      appBar: AppBar(
        title: Text(
          "Informasi (FaQ)",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF36454F), 
        elevation: 2,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemCount: faqData.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return FaqItem(
            question: faqData[index]['q']! as String,
            answer: faqData[index]['a']! as String,
            icon: faqData[index]['icon']! as IconData,
          );
        },
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final IconData icon;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
    required this.icon,
  });

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.icon, color: const Color(0xFF36454F), size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.question,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF36454F),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0, 
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.keyboard_arrow_down, 
                    color: Colors.black54,
                    size: 28,
                  ),
                ),
              ],
            ),

            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                padding: _isExpanded ? const EdgeInsets.only(top: 16) : EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                child: !_isExpanded
                    ? const SizedBox.shrink()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: Colors.grey.shade300, height: 1),
                          const SizedBox(height: 12),
                          Text(
                            widget.answer,
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
            ),
          ],
        ),
      ),
    );
  }
}
