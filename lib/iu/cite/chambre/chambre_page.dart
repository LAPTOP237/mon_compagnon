// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/widgets/chambre_list.dart';
import 'package:mon_compagnon/iu/widgets/filter_recette_list.dart';

class ChambrePage extends StatefulWidget {
  const ChambrePage({super.key});

  @override
  _ChambrePageState createState() => _ChambrePageState();
}

class _ChambrePageState extends State<ChambrePage> {
  // int _selectedIndex = 0;

  // void _onMenuTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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
          'LA CITADELLE',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SizedBox(height: 10),
          // const FilterRecetteList(),
          IndexedStack(
            index: 0,
            children: [
              FilterRecetteList(),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: 0,
              children: [
                ChambreList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
