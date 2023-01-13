class RegisterModel {
  String? nome;
  String? email;
  double? renda;
  String? senha;

  RegisterModel({
    this.nome,
    this.email,
    this.renda,
    this.senha,
  });

  RegisterModel.fromFirestore(Map<String, dynamic> map) {
    nome = map["nome"] ?? "";
    email = map["email"] ?? "";
    renda = map["renda"] ?? "";
    senha = map["senha"] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "email": email,
      "renda": renda,
    };
  }
}
