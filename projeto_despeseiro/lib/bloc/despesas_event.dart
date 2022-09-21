import 'package:despesas_pessoais/models/despesa.dart';

abstract class DespesaEvent {}

class ReadDespesasEvent extends DespesaEvent {}

class AddDespesaEvent extends DespesaEvent {
  Despesa despesa;

  AddDespesaEvent({required this.despesa});
}

class RemoveDespesaEvent extends DespesaEvent {
  Despesa despesa;

  RemoveDespesaEvent({required this.despesa});
}
