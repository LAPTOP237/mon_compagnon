import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/auth/home_page.dart';
import 'package:mon_compagnon/iu/cite/cite_page.dart';
import 'package:mon_compagnon/iu/recette/detail_recette_page.dart';
import 'starter_page.dart';
import 'package:provider/provider.dart';
import 'package:mon_compagnon/viewmodels/login_view_model.dart';
import 'package:mon_compagnon/viewmodels/registration_view_model.dart';
import 'package:mon_compagnon/iu/auth/login_page.dart';
import 'package:mon_compagnon/iu/auth/register_page.dart';
import 'package:mon_compagnon/iu/account_type_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegistrationViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mon Compagnon',
        initialRoute: '/',
        routes: {
          '/': (context) => const StarterPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const ResgisterPage(),
          '/accountSelect': (context) => const AccountSelectPage(),
          '/home': (context) => const HomePage(),
          '/cite': (context) => const CitePage(),
          '/detailRecette': (context) => const DetailRecettePage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(61, 48, 162, 1)),
          useMaterial3: true,
        ),
      ),
    );
  }
}
