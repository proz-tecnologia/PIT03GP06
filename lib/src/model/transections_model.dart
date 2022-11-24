class Transaction {
  final double valor;
  final String descricao;
  final String formPag;
  final String categoryname;
  final DateTime dateTime;

  Transaction({
    required this.formPag,
    required this.valor,
    required this.descricao,
    required this.categoryname,
    required this.dateTime,
  });
}
