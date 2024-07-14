import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'halaman/home.dart';
import 'halaman/helppage.dart';
import 'halaman/menupage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smiles Monitoring',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHome(),
        '/help': (context) => const HelpPage(),
        '/menu': (context) => const MenuPage(),
      },
    );
  }
}
