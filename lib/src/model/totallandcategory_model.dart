class TotalandCategory {
  String? id;
  String? date;
  String? type;
  late double valor;
  String? descri;
  String? formPag;
  String? categoryname;
  String? nome;
  String? email;
  double? renda;
  String? senha;

  TotalandCategory({
    required this.id,
    required this.date,
    required this.type,
    required this.formPag,
    required this.valor,
    required this.descri,
    this.categoryname,
    this.nome,
    this.email,
    this.renda,
    this.senha,
  });

  TotalandCategory.fromFirestore(Map<String, dynamic> map) {
    id = map["id"] ?? "";
    date = map["date"] ?? "";
    type = map["tipo"] ?? "";
    formPag = map["formapag"] ?? "";
    valor = map["valor"] ?? 0.0;
    descri = map["descricao"] ?? "";
    categoryname = map["categoria"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "date": date,
      "tipo": type,
      "formapag": formPag,
      "valor": valor,
      "descricao": descri,
      "categoria": categoryname
    };
  }
}
