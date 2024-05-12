import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/auth/register_page.dart';
import 'package:mon_compagnon/viewmodels/login_view_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel =
        LoginViewModel(); // Initialisez votre ViewModel
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
                                const InputDecoration(labelText: 'Login'),
                            onChanged: (value) =>
                                loginViewModel.setLogin(value),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Mot de passe'),
                            obscureText: true,
                            onChanged: (value) =>
                                loginViewModel.setPassword(value),
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              loginViewModel
                                  .submitForm(); // Action à effectuer lors de la soumission du formulaire
                            },
                            child: const Text('Se Connecter'),
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
                                    builder: (context) =>
                                        const ResgisterPage()));
                          },
                          child: const Text(
                            'Je n\'ai pas de compte',
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
