import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              'Bienvenue,',
                              style: TextStyle(
                                color: Color.fromRGBO(61, 48, 162, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              ' LINJOUOM',
                              style: TextStyle(
                                color: Color.fromRGBO(176, 94, 255, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      'Ajoutez votre cité pour continuer,',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(61, 48, 162, 1),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/addCite');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(61, 48, 162, 1),
                        fixedSize: const Size(230, 45),
                      ),
                      child: const Row(children: [
                        Text('J\'ajoute ma cité  ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                        ),
                      ]),
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
