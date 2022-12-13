class TotalandCategory {
  final String id;//const Uuid().v4();
  final String date;
  final String type;
  //final Icon icon;
  final double valor;
  final String descri;
  final String formPag;
  final String? categoryname;
  final String? nome;
  final String? email;
  final double? renda;
  final String? senha;

  TotalandCategory({
    required this.id,
    required this.date,
    required this.type,
    //required this.icon,
    required this.formPag,
    required this.valor,
    required this.descri,
    this.categoryname,
    this.nome,
    this.email,
    this.renda,
    this.senha,
  });

}
