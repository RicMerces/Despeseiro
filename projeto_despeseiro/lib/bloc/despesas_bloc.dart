import 'dart:async';

import 'package:despesas_pessoais/bloc/despesas_event.dart';
import 'package:despesas_pessoais/bloc/despesas_state.dart';
import 'package:despesas_pessoais/models/despesa.dart';
import 'package:despesas_pessoais/utils/despesas_list.dart';

class DespesaBloc {
  final _despesaList = DepesasUtils();

  final StreamController<DespesaEvent> _inputDespesaControll =
      StreamController<DespesaEvent>();
  final StreamController<DespesaState> _outputDespesaControll =
      StreamController<DespesaState>();

  Sink<DespesaEvent> get inputDepesa => _inputDespesaControll.sink;

  Stream<DespesaState> get stream => _outputDespesaControll.stream;

  DespesaBloc() {
    _inputDespesaControll.stream.listen(_mapEvent);
  }

  _mapEvent(DespesaEvent event) {
    List<Despesa> despesas = [];

    if (event is ReadDespesasEvent) {
      despesas = _despesaList.readDespesas();
    } else if (event is AddDespesaEvent) {
      despesas = _despesaList.addDespesa(event.despesa);
    } else if (event is RemoveDespesaEvent) {
      despesas = _despesaList.removeDespesa(event.despesa);
    }
    _outputDespesaControll.add(DespesasSucessState(despesa: despesas));
  }
}
