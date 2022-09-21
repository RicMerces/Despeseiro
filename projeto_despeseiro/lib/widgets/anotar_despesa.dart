import 'package:despesas_pessoais/bloc/despesas_bloc.dart';
import 'package:despesas_pessoais/bloc/despesas_event.dart';
import 'package:despesas_pessoais/models/despesa.dart';
import 'package:despesas_pessoais/resources/colors_despeseiro.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnotarDespesa extends StatelessWidget {
  const AnotarDespesa({
    Key? key,
    required this.bloc,
    required this.controleTitulo,
    required this.controleValor,
  }) : super(key: key);

  final DespesaBloc bloc;
  final TextEditingController controleTitulo;
  final TextEditingController controleValor;
  @override
  Widget build(BuildContext context) {
    Despesa novo = Despesa(titulo: '', value: 0, data: DateTime.now());
    return Container(
      height: 700,
      padding: const EdgeInsets.all(29),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Adicionar despesa',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: controleTitulo,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Titulo despesas',
              fillColor: const Color(0xffD9D9D9),
              hintStyle:
                  const TextStyle(fontSize: 20, color: ColorsDespeseiro.cor4),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorsDespeseiro.cor4),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(),
          TextField(
            keyboardType: TextInputType.number,
            controller: controleValor,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Valor (R\$)',
              hintStyle:
                  const TextStyle(fontSize: 20, color: ColorsDespeseiro.cor4),
              fillColor: const Color(0xffD9D9D9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorsDespeseiro.cor4),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Data selecionada : ',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 79, 79, 79),
              ),
              children: [
                TextSpan(
                  text: DateFormat('d/MM/y').format(DateTime.now()).toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                  child: const Text(
                    'Mudar data',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorsDespeseiro.cor2,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  novo = Despesa(
                    titulo: controleTitulo.text,
                    value: double.parse(
                      double.parse(controleValor.text)
                          .toStringAsFixed(2)
                          .toString(),
                    ),
                    data: DateTime.now(),
                  );
                  bloc.inputDepesa.add(
                    AddDespesaEvent(despesa: novo),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 35),
                  child: const Text(
                    'Adicionar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: ColorsDespeseiro.cor1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
