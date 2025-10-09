import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/Information/Mountain/JawaBarat/ciremai.dart';
import 'package:montugo/Screens/Information/Mountain/JawaBarat/gede.dart';
import 'package:montugo/Screens/Information/Mountain/JawaBarat/papandayan.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTengah/merapi.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTengah/prau.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTengah/sindoro.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTimur/bromo.dart';
import 'package:montugo/Screens/Information/Mountain/JawaTimur/semeru.dart';

class Categorymountain extends StatelessWidget {
  const Categorymountain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Gunung",
          style: GoogleFonts.istokWeb(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const KategoriGunung(),
    );
  }
}

class KategoriGunung extends StatefulWidget {
  const KategoriGunung({super.key});

  @override
  State<KategoriGunung> createState() => _KategoriGunungState();
}

class _KategoriGunungState extends State<KategoriGunung> {
  // Data gunung
  final List<Map<String, dynamic>> gunungList = [
    {
      "nama": "Gunung Papandayan",
      "tinggi": "2.665 Mdpl",
      "provinsi": "Jawa Barat",
      "image": "assets/images/mountainImage/JawaBaratImage/Papandayan.jpg",
      "page": const PapandayanNav(),
    },
    {
      "nama": "Gunung Prau",
      "tinggi": "2.565 Mdpl",
      "provinsi": "Jawa Tengah",
      "image": "assets/images/mountainImage/JawaTengahImage/Prau.jpg",
      "page": const PrauNav(),
    },
    {
      "nama": "Gunung Bromo",
      "tinggi": "2.329 Mdpl",
      "provinsi": "Jawa Timur",
      "image": "assets/images/mountainImage/JawaTimurImage/bromo.jpg",
      "page": const BromoNav(),
    },
    {
      "nama": "Gunung Semeru",
      "tinggi": "3.676 Mdpl",
      "provinsi": "Jawa Timur",
      "image": "assets/images/mountainImage/JawaTimurImage/semeru.jpg",
      "page": const SemeruNav(),
    },
    {
      "nama": "Gunung Gede",
      "tinggi": "2.958 Mdpl",
      "provinsi": "Jawa Barat",
      "image": "assets/images/JawaBarat.jpg",
      "page": const GedeNav(),
    },
    {
      "nama": "Gunung Ciremai",
      "tinggi": "3.078 Mdpl",
      "provinsi": "Jawa Barat",
      "image": "assets/images/mountainImage/JawaBaratImage/ciremai.jpg",
      "page": const CiremaiNav(),
    },
    {
      "nama": "Gunung Sindoro",
      "tinggi": "3.150 Mdpl",
      "provinsi": "Jawa Tengah",
      "image": "assets/images/mountainImage/JawaTengahImage/Sindoroo.jpg",
      "page": const SindoroNav(),
    },
    {
      "nama": "Gunung Merapi",
      "tinggi": "2.930 Mdpl",
      "provinsi": "Jawa Tengah",
      "image": "assets/images/mountainImage/JawaTengahImage/merapii.jpg",
      "page": const MerapiNav(),
    },
  ];

  List<Map<String, dynamic>> hasilPencarian = [];
  String keyword = "";
  String? provinsiDipilih;

  @override
  void initState() {
    super.initState();
    hasilPencarian = gunungList;
  }

  void _filterData() {
    setState(() {
      hasilPencarian = gunungList.where((item) {
        final cocokKeyword =
            item["nama"].toLowerCase().contains(keyword.toLowerCase());
        final cocokProvinsi =
            provinsiDipilih == null || item["provinsi"] == provinsiDipilih;

        return cocokKeyword && cocokProvinsi;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provinsiList =
        gunungList.map((e) => e["provinsi"] as String).toSet().toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            //  SearchBar
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Cari gunung...",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  keyword = value;
                  _filterData();
                },
              ),
            ),

            const SizedBox(height: 15),

            //  Filter Provinsi
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Filter Provinsi",
                            style: GoogleFonts.istokWeb(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 54, 69, 79),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            leading: const Icon(Icons.public,
                                color: Color.fromARGB(255, 54, 69, 79)),
                            title: const Text("Semua Provinsi"),
                            onTap: () {
                              setState(() {
                                provinsiDipilih = null;
                                _filterData();
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ...provinsiList.map((prov) => ListTile(
                                leading: const Icon(Icons.terrain,
                                    color: Color.fromARGB(255, 54, 69, 79)),
                                title: Text(prov),
                                onTap: () {
                                  setState(() {
                                    provinsiDipilih = prov;
                                    _filterData();
                                  });
                                  Navigator.pop(context);
                                },
                              )),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provinsiDipilih ?? "Pilih Provinsi",
                      style: GoogleFonts.istokWeb(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:
                            const Color.fromARGB(255, 54, 69, 79), // charcoal
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 54, 69, 79)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //  List Gunung
            Column(
              children: hasilPencarian.map((item) {
                return buildMountainCard(
                  context,
                  title: item["nama"],
                  height: item["tinggi"],
                  imagePath: item["image"],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item["page"]),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Card Gunung
  Widget buildMountainCard(
    BuildContext context, {
    required String title,
    required String height,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 19),
      width: double.infinity,
      height: 139,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 139,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  height,
                  style: GoogleFonts.istokWeb(
                    fontSize: 14,
                    color: Colors.amber,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    onPressed: onPressed,
                    child: const Text("See details"),
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
