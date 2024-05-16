// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DetailRecettePage extends StatefulWidget {
  const DetailRecettePage({super.key});

  @override
  _DetailRecettePageState createState() => _DetailRecettePageState();
}

class _DetailRecettePageState extends State<DetailRecettePage> {
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
          'OKOK SUCRE',
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
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                "Ce plat est d'origine du cameroun, tres bon, il permet de piqué les gars des gens..."),
            const SizedBox(
              height: 5,
            ),
            const Text('Ingredients :',
                style: TextStyle(
                  color: Color.fromRGBO(61, 48, 162, 1),
                  fontWeight: FontWeight.bold,
                )),
            const Text(
                "- Feuille d'okok \n- Arachide 100g \n- Noix de palme \n- Manioc ou Batons"),
            const SizedBox(
              height: 5,
            ),
            const Text('Preparation :',
                style: TextStyle(
                  color: Color.fromRGBO(61, 48, 162, 1),
                  fontWeight: FontWeight.bold,
                )),
            const Text(
                "- Etape 1 : Griller les arachides \n- Etape 2 : Ecraser les arachides \n- Etape 3: Bouillie l'eau et verser les feuilles \n- Etape 4: Manioc ou Batons"),
          ],
        ),
      ),
    );
  }
}
