import 'package:flutter/material.dart';
import 'package:mon_compagnon/iu/auth/home_page.dart';
import 'package:mon_compagnon/iu/cite/chambre/chambre_add_page.dart';
import 'package:mon_compagnon/iu/cite/chambre/chambre_detail_page.dart';
import 'package:mon_compagnon/iu/cite/chambre/chambre_page.dart';
import 'package:mon_compagnon/iu/cite/chambre/cite_detail_page.dart';
import 'package:mon_compagnon/iu/cite/chambre/detail_chambre_page.dart';
import 'package:mon_compagnon/iu/cite/cite_add_page.dart';
import 'package:mon_compagnon/iu/cite/cite_page.dart';
import 'package:mon_compagnon/iu/profile_page.dart';
import 'package:mon_compagnon/iu/recette/detail_recette_page.dart';
import 'package:mon_compagnon/iu/validation_request_page.dart';
import 'package:mon_compagnon/viewmodels/chambre_view_model.dart';
import 'package:mon_compagnon/viewmodels/cite_view_model.dart';
import 'package:mon_compagnon/viewmodels/profile_view_model.dart';
import 'package:mon_compagnon/viewmodels/validation_request_view_model.dart';
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
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => CiteViewModel()),
        ChangeNotifierProvider(create: (_) => ChambreViewModel()),
        ChangeNotifierProvider(
          create: (_) => ValidationRequestViewModel(),
        ),
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
          '/profile': (context) => const ProfilePage(),
          '/home': (context) => const HomePage(),
          '/cite': (context) => const CitePage(),
          '/detailRecette': (context) => const DetailRecettePage(),
          '/chambreCite': (context) => const ChambrePage(),
          '/detailChambreCite': (context) => const DetailChambrePage(),
          '/addCite': (context) => const CiteAddPage(),
          '/addChambre': (context) => const ChambreAddPage(),
          '/citeDetail': (context) => const CiteDetailPage(),
          '/chambreDetail': (context) => const ChambreDetailPage(),
          '/validationRequest': (context) => const ValidationRequestPage(),
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
