import 'package:flutter/material.dart';

class RecetteList extends StatelessWidget {
  const RecetteList({super.key});

  @override
  Widget build(BuildContext context) {
    return // Column(
        //   children: [
        // const FilterRecetteList(),
        GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, // To make the cards square
      ),
      itemCount: 10, // Replace with the actual number of recipes
      itemBuilder: (context, index) {
        return Card(
          color: Colors.purple,
          child: InkWell(
            onTap: () {
              // Handle card tap if needed
              Navigator.pushReplacementNamed(context, '/detailRecette');
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/logo1.png'), // Replace with your image assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
    // ]);
  }
}
