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

  final List<String> historicform = <String>['Todos', 'Despesa', 'Receita'];

  String categoryname = '';
  String descricao = '';
  double valor = 0;
  String formpag = '';
  var dateTime = DateTime.now();
  String nome = '';
  String email = '';
  String senha = '';
}
