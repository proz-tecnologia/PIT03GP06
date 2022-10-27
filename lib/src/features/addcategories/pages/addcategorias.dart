import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
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
                Text(
                  'Despesas',
                  style: TextStyle(
                    fontSize: 20,
                    color: DarkController.instance.darkmod
                        ? const Color.fromARGB(207, 255, 255, 255)
                        : const Color.fromARGB(220, 104, 89, 205),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: values,
                  elevation: 16,
                  style: TextStyle(
                    color: DarkController.instance.darkmod
                        ? const Color.fromARGB(207, 255, 255, 255)
                        : const Color.fromARGB(220, 104, 89, 205),
                  ),
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
                      decoration: InputDecoration(
                        helperText: "Campo obrigatório",
                        labelText: 'Descrição',
                        hintText: "Compras queijo...",
                        labelStyle: TextStyle(
                          color: DarkController.instance.darkmod
                              ? const Color.fromARGB(207, 255, 255, 255)
                              : const Color.fromARGB(220, 104, 89, 205),
                        ),
                        focusedBorder: const UnderlineInputBorder(
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
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(220, 104, 89, 205),
                        ),
                      ),
                      labelText: "Valor",
                      labelStyle: TextStyle(
                        color: DarkController.instance.darkmod
                            ? const Color.fromARGB(207, 255, 255, 255)
                            : const Color.fromARGB(220, 104, 89, 205),
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
                      decoration: InputDecoration(
                    labelText: 'Forma de pagamento(opcional)',
                    hintText: "Pix...",
                    labelStyle: TextStyle(
                      color: DarkController.instance.darkmod
                          ? const Color.fromARGB(207, 255, 255, 255)
                          : const Color.fromARGB(220, 104, 89, 205),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(220, 104, 89, 205),
                      ),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ButtomReceitas(),
                      SizedBox(
                        width: 130,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 48, 201, 43)),
                          child: const Text('Salvar'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
