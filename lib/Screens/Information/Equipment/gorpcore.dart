import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JaketGunung extends StatelessWidget {
  const JaketGunung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jaket",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: jaket(),
    );
  }
}

class jaket extends StatelessWidget {
  const jaket({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 10, top: 20)),
          Container(
            width: 362,
            height: 227,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/equipmentImage/Gorpcore.jpg'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Jaket",
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
                padding: EdgeInsets.only(left: 15),
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
