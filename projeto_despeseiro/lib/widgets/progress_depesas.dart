import 'package:despesas_pessoais/widgets/barra.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/despesa.dart';

class ProgressDepesas extends StatefulWidget {
  const ProgressDepesas({Key? key, required this.despesaRecent})
      : super(key: key);

  final List<Despesa> despesaRecent;

  @override
  _ProgressDepesasState createState() => _ProgressDepesasState();
}

class _ProgressDepesasState extends State<ProgressDepesas> {
  List<Map<String, Object>> get despesasDiarias {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (int i = 0; i < widget.despesaRecent.length; i++) {
        bool sameDay = widget.despesaRecent[i].data.day == weekDay.day;

        if (sameDay) {
          totalSum += widget.despesaRecent[i].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    }).reversed.toList();
  }

  List<Despesa> get _recentDespesa {
    return _recentDespesa.where((tr) {
      return tr.data.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  double get _weekTotalValue {
    return despesasDiarias.fold(0.0, (soma, tr) {
      return soma + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // despesasDiarias;
    return Row(
      children: despesasDiarias.map((tr) {
        double percentual = (tr['value'] as double) / _weekTotalValue;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   percentual.toString(),
            //   style: const TextStyle(color: Colors.red),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Barra(
                dia: tr['day'].toString(),
                valor: tr['value'] as double,
                porcentagem: _weekTotalValue == 0 ? 0 : percentual,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
