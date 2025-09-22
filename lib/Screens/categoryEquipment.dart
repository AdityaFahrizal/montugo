import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/Information/Equipment/carrierBag.dart';
import 'package:montugo/Screens/Information/Equipment/gorpcore.dart';
import 'package:montugo/Screens/Information/Equipment/shoes.dart';
import 'package:montugo/Screens/Information/Equipment/trackingPole.dart';

class Categoryequipment extends StatelessWidget {
  const Categoryequipment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Peralatan",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const kategoriPeralatan(),
    );
  }
}

class kategoriPeralatan extends StatelessWidget {
  const kategoriPeralatan({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20, left: 10)),
          SizedBox(
            width: 362,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
              ),
              child: SearchBar(
                textInputAction: TextInputAction.search,
                hintText: "Cari di sini...",
                leading: Icon(Icons.search),
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                elevation: WidgetStatePropertyAll(0),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Trekkingpole(),
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
                              'assets/images/equipmentImage/Pole.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Trekking Pole",
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
                      builder: (context) => JaketGunung(),
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
                              'assets/images/equipmentImage/Gorpcore.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Trekking Pole",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 19),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KantongGunung(),
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
                              'assets/images/equipmentImage/carrier.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Tas Carrier",
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
                      builder: (context) => spatuGunung(),
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
                              'assets/images/equipmentImage/sepatu.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Text
                    const Positioned(
                      top: 110,
                      left: 12,
                      child: Text(
                        "Sepatu Gunung",
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
