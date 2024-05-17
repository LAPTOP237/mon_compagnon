// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DetailChambrePage extends StatefulWidget {
  const DetailChambrePage({super.key});

  @override
  _DetailChambrePageState createState() => _DetailChambrePageState();
}

class _DetailChambrePageState extends State<DetailChambrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(61, 48, 162, 1),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: const Icon(
            Icons.call_outlined,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
        leading: const Icon(
          // Icons.logout,
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: const Text(
          'Chambre 167',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color.fromRGBO(61, 48, 162, 1),
              child: Stack(children: [
                Container(
                  //  color: Colors.red,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
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
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 2.0),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 25.0,
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
                      color: Colors.green,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                "Cette chambre est l'une des meilleurs placé au second niveau a l'abri de la chaleur"),
            const SizedBox(
              height: 5,
            ),
            const Text('Prix :',
                style: TextStyle(
                  color: Color.fromRGBO(61, 48, 162, 1),
                  fontWeight: FontWeight.bold,
                )),
            const Text("25 000 Frs"),
            const SizedBox(
              height: 5,
            ),
            const Text('Equipé ? :',
                style: TextStyle(
                  color: Color.fromRGBO(61, 48, 162, 1),
                  fontWeight: FontWeight.bold,
                )),
            const Text("Oui"),
          ],
        ),
      ),
    );
  }
}
