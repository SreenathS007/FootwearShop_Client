import 'package:flutter/material.dart';
import 'package:shopy_client/pages/product_description_page.dart';
import 'package:shopy_client/widgets/multi_select_drop_down.dart';
import 'package:shopy_client/widgets/product_card.dart';

import '../widgets/dropdown_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          'Footwear Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Chip(label: Text('Category')),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropDownBtn(
                    items: ['Rs: Low to High', 'Rs: High to Low'],
                    selectedItemText: 'Sort',
                    onSelected: (selected) {},
                  ),
                ),
                Expanded(
                  child: MultiSelectDropDown(
                    items: ['item1', 'item2', 'item3'],
                    onSelectionChanged: (selectedItems) {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7, // Adjusted childAspectRatio
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: 'Nike Footwear',
                    imageUrl:
                        'https://assets.ajio.com/medias/sys_master/root/20240220/JIUb/65d4cac205ac7d77bb6a5d38/-473Wx593H-469581310-black-MODEL.jpg',
                    price: 999,
                    offerTag: '30% off',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDescription(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
