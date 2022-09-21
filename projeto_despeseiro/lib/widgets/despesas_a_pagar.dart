import 'package:despesas_pessoais/bloc/despesas_bloc.dart';
import 'package:despesas_pessoais/bloc/despesas_event.dart';
import 'package:despesas_pessoais/models/despesa.dart';
import 'package:despesas_pessoais/resources/colors_despeseiro.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DespesasAPagar extends StatelessWidget {
  const DespesasAPagar({Key? key, required this.despesa, required this.bloc})
      : super(key: key);

  final Despesa despesa;
  final DespesaBloc bloc;

  @override
  Widget build(BuildContext context) {
    String titulo = despesa.titulo;
    String valor = despesa.value.toStringAsFixed(2).replaceAll('.', ',');
    String reais = valor;
    String data = DateFormat('d/M/y').format(despesa.data);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        // color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(115, 35, 35, 35).withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorsDespeseiro.cor1,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      reais,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                        color: ColorsDespeseiro.cor2,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data,
                    style: const TextStyle(
                        color: ColorsDespeseiro.cor4,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              bloc.inputDepesa.add(RemoveDespesaEvent(despesa: despesa));
            },
            icon: const Icon(
              Icons.close,
              color: ColorsDespeseiro.cor4,
            ),
          )
        ],
      ),
    );
  }
}
