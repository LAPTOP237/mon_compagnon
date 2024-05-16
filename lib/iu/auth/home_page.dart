import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mon_compagnon/viewmodels/login_view_model.dart';
import 'package:mon_compagnon/utils/session_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              SessionManager.clearSession();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<LoginViewModel>(
          builder: (context, loginViewModel, child) {
            return FutureBuilder<void>(
              future: SessionManager.getSession(''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return const Text('Bienvenue, LINJOUOM');
                  //  'Bienvenue, ${SessionManager.getSession('username')
                }
              },
            );
          },
        ),
      ),
    );
  }
}
