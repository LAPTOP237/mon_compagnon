import 'package:flutter/material.dart';

class ChambreList extends StatelessWidget {
  const ChambreList({super.key});

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
            itemCount: 10, // Replace with the actual number of cites
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromRGBO(61, 48, 162, 1),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        // Handle card tap if needed
                        Navigator.pushReplacementNamed(
                            context, '/detailChambreCite');
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 8.0,
                      left: 8.0,
                      child: Row(
                        children: [
                          Text(
                            '5',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 8.0,
                      right: 8.0,
                      child: Text(
                        'Libre',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Text(
                        'Chambre 167',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
    //   ],
    // );
  }
}
