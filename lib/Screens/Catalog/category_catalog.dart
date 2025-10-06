import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montugo/data/catalog_data.dart';
import 'package:montugo/models/catalog_item_model.dart';
import 'package:montugo/Screens/Information/Equipment/carrierBag.dart';
import 'package:montugo/Screens/Information/Equipment/gorpcore.dart';
import 'package:montugo/Screens/Information/Equipment/shoes.dart';
import 'package:montugo/Screens/Information/Equipment/trackingPole.dart';
import 'package:montugo/Screens/Information/Logistic/tent.dart';
import 'package:montugo/Screens/Information/Logistic/stove.dart';
import 'package:montugo/Screens/Information/Logistic/nesting.dart';

class CategoryCatalog extends StatefulWidget {
  const CategoryCatalog({super.key});

  @override
  State<CategoryCatalog> createState() => _CategoryCatalogState();
}

class _CategoryCatalogState extends State<CategoryCatalog> {
  String _selectedCategory = 'All';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<CatalogItemModel> filteredItems = catalogItems.where((item) {
      final matchesCategory =
          _selectedCategory == 'All' || item.category == _selectedCategory;
      final matchesSearch =
          item.title.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        const SizedBox(height: 20),
        _buildSearchBar(),
        const SizedBox(height: 15),
        _buildCategoryButtons(),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final item = filteredItems[index];
              return CatalogListItem(
                item: item,
                onTap: () {
                  _navigateToDetail(context, item.title);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
        child: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: const InputDecoration(
            hintText: "Cari di sini...",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCategoryButton('All'),
        const SizedBox(width: 12),
        _buildCategoryButton('Equipment'),
        const SizedBox(width: 12),
        _buildCategoryButton('Logistic'),
      ],
    );
  }

  Widget _buildCategoryButton(String category) {
    final bool isSelected = _selectedCategory == category;
    return ChoiceChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedCategory = category;
          });
        }
      },
      backgroundColor: Colors.grey[200],
      selectedColor: const Color.fromARGB(255, 54, 69, 79),
      labelStyle: GoogleFonts.istokWeb(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color:
              isSelected ? const Color.fromARGB(255, 54, 69, 79) : Colors.grey,
        ),
      ),
      showCheckmark: false,
    );
  }

  void _navigateToDetail(BuildContext context, String title) {
    Widget? page;
    switch (title) {
      case 'Tas Carrier':
        page = const TasCarrierNav();
        break;
      case 'Jaket Gunung (GORPCore)':
        page = const JaketGunungNav();
        break;
      case 'Sepatu Gunung':
        page = const SepatuGunungNav();
        break;
      case 'Trekking Pole':
        page = const TrekkingPoleNav();
        break;
      case 'Tenda Dome Camping 2P':
        page = const TendaNav();
        break;
      case 'Kompor Portable':
        page = const KomporPortableNav();
        break;
      case 'Cookset Gunung':
        page = const CooksetNav();
        break;
    }
    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
    }
  }
}

class CatalogListItem extends StatelessWidget {
  final CatalogItemModel item;
  final VoidCallback onTap;

  const CatalogListItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: GoogleFonts.istokWeb(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.price,
                      style: GoogleFonts.istokWeb(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.description,
                      style: GoogleFonts.istokWeb(
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
