import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GedeNav extends StatelessWidget {
  const GedeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gunung Gede",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const Gede(),
    );
  }
}

class Gede extends StatelessWidget {
  const Gede({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(left: 15, top: 15)),
          Container(
            width: 362,
            height: 227,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/mountainImage/JawaBaratImage/Papandayan.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Gunung Papandayan",
                  style: GoogleFonts.istokWeb(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Lorem Ipsum Dolor Sit Amet",
                  style: GoogleFonts.istokWeb(fontSize: 15),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
