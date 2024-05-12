import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/auth/login_page.dart';
import 'package:mon_compagnon/iu/auth/register_page.dart';

class AccountSelectPage extends StatelessWidget {
  const AccountSelectPage({super.key});

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Logo de l'application
              Image.asset(
                'assets/logo.png', // Chemin vers le fichier image du logo
                width: 100.0,
                height: 100.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20.0),
              // Cadre blanc
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Texte "S’inscrire en tant que"
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'S’inscrire en tant que',
                          style: TextStyle(
                            color: Color.fromRGBO(61, 48, 162, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Boutons "Etudiant" et "Responsable de ciTE
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResgisterPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                        fixedSize: const Size(250, 45),
                      ),
                      child: const Text('Etudiant',
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResgisterPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                        fixedSize: const Size(250, 45),
                      ),
                      child: const Text('Responsable de cité',
                          style: TextStyle(color: Colors.white)),
                    ),

                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Texte 'J'ai déjà un compte'
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
                              color: Color.fromRGBO(176, 94, 255, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
