import 'package:flutter/material.dart';
import 'package:mon_compagnon/utils/session_manager.dart';

class RecettePage extends StatelessWidget {
  const RecettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: CustomScrollView(
        slivers: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                    ),
                    child: const Text('Cite',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                    ),
                    child: const Text('Recette',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
