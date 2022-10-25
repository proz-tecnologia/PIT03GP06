import 'package:ctrl_real/src/features/addcategories/widgets/buttonreceitas.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

const List<String> categorieslist = <String>[
  'Supermercado',
  'Lazer',
  'Transporte',
  'Farmacia',
  'Pagamentos',
  'Gastos extras'
];

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  double? value;
  String values = categorieslist.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: false,
          floating: true,
          title: Text('Registros'),
          centerTitle: true,
        ),
        const SliverToBoxAdapter(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 38.0),
            child: Column(
              children: <Widget>[
                const Text(
                  'Despesas',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(220, 104, 89, 205)),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  hint: const Text("Categorias..."),
                  isExpanded: true,
                  value: values,
                  elevation: 16,
                  style:
                      const TextStyle(color: Color.fromARGB(220, 104, 89, 205)),
                  onChanged: (String? value) {
                    setState(() {
                      values = value!;
                    });
                  },
                  items: categorieslist
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 40,
                      validator: (value) {
                        if (value!.length < 3 || value.length > 40) {
                          return "Informe uma descrição";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        helperText: "Campo obrigatório",
                        labelText: 'Descrição',
                        hintText: "Compras queijo...",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(220, 104, 89, 205),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(220, 104, 89, 205),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                          locale: 'pt-BR', decimalDigits: 2, symbol: '')
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Valor",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(220, 104, 89, 205),
                      ),
                      hintText: "0,00",
                      prefix: Text("R\$"),
                      helperText: "Máximo de 999.999,99 digitos",
                    ),
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe um valor";
                      }
                      ;
                      final valueDouble = double.parse(
                          value.replaceAll(".", "").replaceAll(",", "."));
                      if (valueDouble == 0) {
                        return "Informe um valor diferente de 0";
                      }
                      return null;
                    },
                    onSaved: ((newValue) => value = double.parse(
                        newValue!.replaceAll(".", "").replaceAll(",", "."))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: TextFormField(
                      decoration: const InputDecoration(
                    labelText: 'Forma de pagamento(opcional)',
                    hintText: "Pix...",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(220, 104, 89, 205),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(220, 104, 89, 205),
                      ),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: IconButton(
                    iconSize: 38,
                    icon: const Icon(Icons.save),
                    color: Colors.green,
                    onPressed: () {},
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: ButtomReceitas()),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
