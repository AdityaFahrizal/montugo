import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/Screens/models/berita_models.dart'; 
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert'; 
import 'dart:typed_data'; 

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
                "Berita & Informasi",
                style: GoogleFonts.istokWeb( 
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF36454F),
        )),),
        SizedBox(
          height: 230, 
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('berita').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Gagal memuat berita'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('Belum ada berita'));
              }

              final newsItems = snapshot.data!.docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                data['imagePath'] = data['image']; 
                return NewsItemModel.fromMap(data);
              }).toList();

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  final item = newsItems[index];
                  return NewsCard(item: item, onTap: () => _launchURL(item.url));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsItemModel item;
  final VoidCallback onTap;

  const NewsCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (item.imagePath.isNotEmpty) {
      try {
        final cleanBase64 = item.imagePath.split(',').last;
        final Uint8List decodedBytes = base64.decode(cleanBase64);
        imageWidget = Image.memory(
          decodedBytes,
          height: 110,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      } catch (e) {
        imageWidget = Container(
          height: 110,
          color: Colors.grey[200],
          child: Center(
            child: Icon(
              Icons.broken_image_outlined,
              color: Colors.grey[400],
              size: 40,
            ),
          ),
        );
      }
    } else {
      imageWidget = Container(
        height: 110,
        color: Colors.grey[200],
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: Colors.grey[400],
            size: 40,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220, 
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: imageWidget, 
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333)
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.description,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
