import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/Information/Logistic/emergencyblanket.dart';
import 'package:montugo/Screens/Information/Logistic/raincoat.dart';
import 'package:montugo/Screens/Information/Logistic/sleepingbag.dart';
import 'package:montugo/Screens/Information/Logistic/tent.dart';

class Categorylogistic extends StatelessWidget {
  const Categorylogistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Logistik",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const KategoriLogistik(),
    );
  }
}

class KategoriLogistik extends StatelessWidget {
  const KategoriLogistik({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20, left: 10)),
          SizedBox(
            width: 362,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              child: SearchBar(
                textInputAction: TextInputAction.search,
                hintText: "Cari di sini...",
                leading: const Icon(Icons.search),
                backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
                elevation: const WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Emergencyblanket(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: 171,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 54, 69, 79),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                    ),

                    // Gambar
                    Container(
                      width: 171,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/logisticImage/emergency.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Emergency Blanket",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Sleepingbag(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: 171,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 54, 69, 79),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                    ),

                    // Gambar
                    Container(
                      width: 171,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/equipmentImage/Sleeping.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Sleeping Bag",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tenda(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: 171,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 54, 69, 79),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                    ),

                    // Gambar
                    Container(
                      width: 171,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/logisticImage/tenda.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Tenda",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JasHujan(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: 171,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 54, 69, 79),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 5),
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                    ),

                    // Gambar
                    Container(
                      width: 171,
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/equipmentImage/poncho.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Jas Hujan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
