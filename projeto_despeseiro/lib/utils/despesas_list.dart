import 'package:despesas_pessoais/models/despesa.dart';

class DepesasUtils {
  final List<Despesa> _listDespesas = [];

  List<Despesa> readDespesas() {
    _listDespesas.addAll([
      Despesa(
          titulo: 'Jogo do Bahia',
          value: 40,
          data: DateTime.now().subtract(const Duration(days: 2))),
      // Despesa(
      //     titulo: 'Jogo do Bahia',
      //     value: 40,
      //     data: DateTime.now().subtract(const Duration(days: 1))),
    ]);
    return _listDespesas;
  }

  List<Despesa> addDespesa(Despesa despesa) {
    _listDespesas.add(despesa);
    return _listDespesas;
  }

  List<Despesa> removeDespesa(Despesa despesa) {
    _listDespesas.remove(despesa);
    return _listDespesas;
  }
}
