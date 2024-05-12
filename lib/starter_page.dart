import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/auth/login_page.dart';

import 'iu/account_type_page.dart';

class StarterPage extends StatelessWidget {
  const StarterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/fond1.png'), // Chemin vers l'image en arrière-plan
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo de l'application
              Image.asset(
                'assets/logo1.png', // Chemin vers le fichier image du logo
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 250.0),
              // Bouton "Get Started"
              // Expanded(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              ElevatedButton(
                onPressed: () {
                  // Redirection vers une autre page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountSelectPage()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 16.0),
                ),
                child: const Text('Get Started',
                    style: TextStyle(
                        color: Color.fromRGBO(61, 48, 162, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ),
              const SizedBox(height: 10.0),
              // Lien "J'ai déjà un compte"
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  'J\'ai déjà un compte',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
