import 'package:despesas_pessoais/models/despesa.dart';

abstract class DespesaState {
  List<Despesa> despesas;

  DespesaState({required this.despesas});
}

class DespesaInitialState extends DespesaState {
  DespesaInitialState() : super(despesas: []);
}

class DespesasSucessState extends DespesaState {
  DespesasSucessState({required List<Despesa> despesa})
      : super(despesas: despesa);
}
