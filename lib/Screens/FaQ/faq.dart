import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        "q": "Apa itu aplikasi MONTUGO?",
        "a":
            "MONTUGO adalah aplikasi mobile yang berfokus pada informasi dan edukasi pendakian gunung di Indonesia."
      },
      {
        "q": "Apa saja fitur utama MONTUGO?",
        "a":
            "• Informasi Gunung – Lokasi, ketinggian, jalur pendakian, dan cuaca.\n• Katalog Perlengkapan – Rekomendasi perlengkapan.\n• Keselamatan & Edukasi – Tips keamanan & darurat."
      },
      {
        "q": "Apakah perlengkapan di katalog bisa dibeli lewat aplikasi?",
        "a":
            "Tidak. Katalog MONTUGO hanya bersifat referensi dan rekomendasi, bukan untuk transaksi."
      },
      {
        "q": "Apakah aplikasi ini cocok untuk pendaki pemula?",
        "a":
            "Ya. MONTUGO dirancang sederhana agar pemula bisa tahu perlengkapan wajib, jalur pendakian, dan edukasi keselamatan."
      },
      {
        "q": "Apa itu prinsip Leave No Trace?",
        "a":
            "Prinsip mendaki dengan menjaga alam: tidak meninggalkan sampah, tidak merusak flora/fauna, tidak mencoret bebatuan, dan tidak membawa pulang benda dari alam."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Informasi",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF36454F), // charcoal
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return AnimatedFaqTile(
            question: faqs[index]["q"]!,
            answer: faqs[index]["a"]!,
          );
        },
      ),
    );
  }
}

class AnimatedFaqTile extends StatefulWidget {
  final String question;
  final String answer;

  const AnimatedFaqTile({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<AnimatedFaqTile> createState() => _AnimatedFaqTileState();
}

class _AnimatedFaqTileState extends State<AnimatedFaqTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          trailing: AnimatedRotation(
            turns: _isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          ),
          title: Text(
            widget.question,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF36454F), // charcoal
            ),
          ),
          onExpansionChanged: (expanded) {
            setState(() => _isExpanded = expanded);
          },
          children: [
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.answer,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            )
          ],
        ),
      ),
    );
  }
}
