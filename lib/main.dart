import 'package:flutter/material.dart';
import 'package:yachay/src/features/Home/presentation/homeprincipal.dart';
import 'package:yachay/src/features/login/presentation/login.dart';
import 'package:yachay/src/features/registro/presentation/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAppLogin(),
      routes: {
        '/home': (context) => const HomePrincipal(),
        '/register': (context) => const MyAppRegistro(),
        '/login': (context) => const MyAppLogin(),
      },
    );
  }
}
