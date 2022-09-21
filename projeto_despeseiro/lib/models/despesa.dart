class Despesa {
  Despesa({
    required this.titulo,
    required this.value,
    required this.data,
  });

  // Usar para datas o DateTimeNow
  String titulo;
  double value;
  DateTime data;
}
