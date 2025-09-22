import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rescue extends StatelessWidget {
  const Rescue({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Keselamatan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
       body: const keselamatan() ,
    );
  }
}

class keselamatan extends StatelessWidget {
  const keselamatan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}