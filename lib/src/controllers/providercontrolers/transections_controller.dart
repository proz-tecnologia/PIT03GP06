class TransactionController {
  final List<String> categoryList = <String>[
    'Supermercado',
    'Lazer',
    'Transporte',
    'Farmacia',
    'Pagamentos',
    'Gastos extras'
  ];

  final List<String> formlist = <String>[
    'Dinheiro',
    'Pix',
    'Débito',
    'Crédito'
  ];

    final List<String> historicform = <String>[
    'Todos',
    'Categorias',
    'Apenas despesas',
    'Apenas receita'
  ];

  String categoryname = '';
  String descri = '';
  double valor = 0;
  String formpag = '';
}
