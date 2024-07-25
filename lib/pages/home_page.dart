import 'package:flutter/material.dart';
import 'package:shopy_client/widgets/multi_select_drop_down.dart';

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
                  child: Chip(label: Text('Catogory')),
                );
              },
            ),
          ),
          Row(
            children: [
              DropDownBtn(
                items: ['Rs: Low toHigh', 'Rs: High to Low'],
                selectedItemText: 'Sort',
                onSelected: (selected) {},
              ),
              MultiSelectDropDown()
            ],
          ),
        ],
      ),
    );
  }
}
