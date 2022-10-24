import 'dart:developer';

import 'package:ctrl_real/src/features/extension/extension_double.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';

class AddCategories extends StatelessWidget {
  AddCategories({super.key, this.value});
  double? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Compras'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
                decoration: InputDecoration(
                    labelText: 'Quantidade',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(220, 104, 89, 205),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(220, 104, 89, 205))))),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Marca',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(220, 104, 89, 205),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(220, 104, 89, 205))))),
            ),
            TextFormField(
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
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: 146,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(220, 104, 89, 205),
                  ),
                  child: const Text('Cadastrar'),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
