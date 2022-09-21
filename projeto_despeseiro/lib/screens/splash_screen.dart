import 'dart:async';

import 'package:despesas_pessoais/resources/colors_despeseiro.dart';
import 'package:despesas_pessoais/resources/images_despeseiro.dart';
import 'package:despesas_pessoais/resources/strings_despeseiro.dart';
import 'package:despesas_pessoais/screens/loading_screenn.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const LoadingScreenn())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDespeseiro.cor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagesDesepeseiro.logo),
            const SizedBox(
              height: 20,
            ),
            const Text(
              StringsDespeseiro.appName,
              style: TextStyle(
                color: ColorsDespeseiro.cor2,
                fontSize: 36,
                fontWeight: FontWeight.w100,
                letterSpacing: 2,
              ),
            ),
            const Text(
              StringsDespeseiro.appDescription,
              style: TextStyle(
                color: ColorsDespeseiro.cor2,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
