import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class AddCategories extends StatelessWidget {
  AddCategories({super.key});
  double? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: false,
          floating: true,
          title: Text('Adicionar compras'),
          centerTitle: true,
        ),
        const SliverToBoxAdapter(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 24.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLength: 20,
                    validator: (value) {
                      if (value!.length < 3 || value.length > 20) {
                        return "Mínimo 3 e máximo 20 caractéres.";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Item',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(220, 104, 89, 205),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(220, 104, 89, 205),
                        ),
                      ),
                    )),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo deve estar prenchido';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantidade',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(220, 104, 89, 205),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(220, 104, 89, 205),
                        ),
                      ),
                    )),
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
                      labelText: "Valor",
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
                  child: SizedBox(
                    width: 140,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8D32E3),
                      ),
                      child: const Text('Alimentação'),
                      onPressed: () {},
                    ),
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
