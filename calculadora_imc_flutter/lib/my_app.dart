import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculadora_imc_flutter/pages/login_page.dart';


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.mohaveTextTheme(),
      ),
      home: const LoginPage(),
    );
  }
}