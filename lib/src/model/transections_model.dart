class Transaction {
  final double valor;
  final String descri;
  final String? formPag;
  final String categoryname;
  

  Transaction({
    this.formPag,
    required this.valor,
    required this.descri,
    required this.categoryname,
  });
}
