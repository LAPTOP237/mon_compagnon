// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/widgets/cite_list.dart';
import 'package:mon_compagnon/iu/widgets/filter_recette_list.dart';
import 'package:mon_compagnon/iu/widgets/recette_list.dart';
import 'package:mon_compagnon/utils/session_manager.dart';

class CitePage extends StatefulWidget {
  const CitePage({super.key});

  @override
  _CitePageState createState() => _CitePageState();
}

class _CitePageState extends State<CitePage> {
  int _selectedIndex = 0;

  void _onMenuTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
      ),
      // FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
      //   child: const Icon(
      //     Icons.search_outlined,
      //     color: Colors.white,
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),
        ),
        title: const Text(
          'Mon Compagnon',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color.fromRGBO(61, 48, 162, 1),
              child: Icon(
                // Icons.logout,
                Icons.settings_outlined,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              SessionManager.clearSession();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
        // shape: const ContinuousRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(300.0),
        //     bottomRight: Radius.circular(300.0),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _onMenuTap(0),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedIndex == 0
                      ? const Color.fromRGBO(61, 48, 162, 1)
                      : const Color.fromRGBO(230, 230, 230, 1),
                ),
                child: Text(
                  'Cité',
                  style: TextStyle(
                    color: _selectedIndex == 0
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromRGBO(176, 94, 255, 1),
                  ),
                ),
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                onPressed: () => _onMenuTap(1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedIndex == 1
                      ? const Color.fromRGBO(61, 48, 162, 1)
                      : const Color.fromRGBO(230, 230, 230, 1),
                ),
                child: Text(
                  'Recette',
                  style: TextStyle(
                    color: _selectedIndex == 1
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromRGBO(176, 94, 255, 1),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromRGBO(158, 158, 158, 1), // color of the divider
            thickness: 1, // thickness of the line
          ),
          // const FilterRecetteList(),
          IndexedStack(
            index: _selectedIndex,
            children: const [
              FilterRecetteList(),
              FilterRecetteList(),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                CiteList(),
                RecetteList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
