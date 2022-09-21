import 'package:despesas_pessoais/resources/colors_despeseiro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Barra extends StatelessWidget {
  const Barra({
    Key? key,
    required this.dia,
    required this.valor,
    required this.porcentagem,
  }) : super(key: key);

  final String dia;
  final double valor;
  final double porcentagem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(valor.toStringAsFixed(2)),
        RotatedBox(
          quarterTurns: -1,
          child: Column(
            children: [
              Container(
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: LinearProgressIndicator(
                    backgroundColor: ColorsDespeseiro.cor4,
                    color: ColorsDespeseiro.cor1,
                    value: porcentagem,
                    minHeight: 27,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(dia)
      ],
    );
  }
}
// return LayoutBuilder(builder: (context, constraints) {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       SizedBox(
    //         height: constraints.maxHeight * 0.15,
    //         child: FittedBox(
    //           child: Text(valor.toStringAsFixed(2)),
    //         ),
    //       ),
    //       SizedBox(
    //         height: constraints.maxHeight * 0.6,
    //         width: 30,
    //         child: Stack(
    //           // mainAxisAlignment: MainAxisAlignment.end,
    //           alignment: Alignment.bottomCenter,
    //           children: [
    //             Container(
    //               decoration: BoxDecoration(
    //                 color: ColorsDespeseiro.cor4,
    //                 borderRadius: BorderRadius.circular(30),
    //               ),
    //             ),
    //             FractionallySizedBox(
    //               heightFactor: porcentagem,
    //               child: Container(
    //                 // height: porcentagem,
    //                 decoration: BoxDecoration(
    //                   color: ColorsDespeseiro.cor1,
    //                   borderRadius: BorderRadius.circular(30),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: constraints.maxHeight * 0.15,
    //         child: Text(dia),
    //       ),
    //     ],
    //   );
    // });