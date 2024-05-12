import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/auth/login_page.dart';
import 'package:mon_compagnon/viewmodels/registration_view_model.dart';

class ResgisterPage extends StatelessWidget {
  const ResgisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationViewModel registrationViewModel =
        RegistrationViewModel(); // Initialisez votre ViewModel
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
                          'Hello !',
                          style: TextStyle(
                            color: Color.fromRGBO(61, 48, 162, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Mon formulaire d'inscription
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextField(
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            onChanged: (value) =>
                                registrationViewModel.setEmail(value),
                          ),
                          TextField(
                            decoration:
                                const InputDecoration(labelText: 'Login'),
                            onChanged: (value) =>
                                registrationViewModel.setLogin(value),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Mot de passe'),
                            obscureText: true,
                            onChanged: (value) =>
                                registrationViewModel.setPassword(value),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Confirmer le mot de passe'),
                            obscureText: true,
                            onChanged: (value) =>
                                registrationViewModel.setConfirmPassword(value),
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              registrationViewModel
                                  .submitForm(); // Action à effectuer lors de la soumission du formulaire
                            },
                            child: const Text('S\'inscrire'),
                          ),
                        ],
                      ),
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
