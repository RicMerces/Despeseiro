import 'dart:async';

import 'package:despesas_pessoais/resources/colors_despeseiro.dart';
import 'package:despesas_pessoais/screens/page_despesas.dart';
import 'package:flutter/material.dart';

class LoadingScreenn extends StatefulWidget {
  const LoadingScreenn({Key? key}) : super(key: key);

  @override
  _LoadingScreennState createState() => _LoadingScreennState();
}

class _LoadingScreennState extends State<LoadingScreenn> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PageDespesas(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsDespeseiro.cor1,
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: CircularProgressIndicator(
            color: ColorsDespeseiro.cor2,
            strokeWidth: 20,
          ),
        ),
      ),
    );
  }
}
