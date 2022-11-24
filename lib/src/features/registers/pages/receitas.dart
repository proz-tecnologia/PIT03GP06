import 'package:ctrl_real/src/controllers/providercontrolers/history_page_controller.dart';
import 'package:ctrl_real/src/controllers/providercontrolers/transections_controller.dart';
import 'package:ctrl_real/src/model/transections_model.dart';

import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceitasPage extends StatefulWidget {
  ReceitasPage({super.key});

  @override
  State<ReceitasPage> createState() => _ReceitasPageState();
}

class _ReceitasPageState extends State<ReceitasPage> {
  double? value;
  final TransactionController controllerReceita = TransactionController();
  final _txtDateTimeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Receitas'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
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
                        hintText: "Hora extra...",
                        labelStyle: TextStyle(
                          color: darkFunctionTexts(),
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
                      labelText: Strings.nameImputValorForm,
                      labelStyle: TextStyle(
                        color: darkFunctionTexts(),
                      ),
                      hintText: "0,00",
                      prefix: const Text("R\$"),
                      helperText: "Máximo de 999.999,99 digitos",
                    ),
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Informe um valor";
                      }
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
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    Strings.nameImputDate,
                    style: TextStyle(
                      color: darkFunctionTexts(),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _txtDateTimeController,
                  keyboardType: TextInputType.datetime,
                  decoration:
                      const InputDecoration(labelText: "Data da Operação"),
                  maxLength: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Informe uma data.";
                    }
                    return null;
                  },
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? date = await showDatePicker(
                        context: context,
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 360)),
                        lastDate: DateTime.now(),
                        initialDate: controllerReceita.dateTime);
                    controllerReceita.dateTime =
                        date ?? controllerReceita.dateTime;
                    _txtDateTimeController.text =
                        "${controllerReceita.dateTime.day}/${controllerReceita.dateTime.month}/${controllerReceita.dateTime.year}";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: SizedBox(
                      width: 130,
                      height: 40,
                      child: Consumer<HistoryController>(
                        builder: (context, historyController, _) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 48, 201, 43)),
                            child: const Text('Registrar'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          Color.fromARGB(220, 104, 89, 205),
                                      content: Text(
                                        'Registrado!',
                                        textAlign: TextAlign.center,
                                      )),
                                );
                                var trans = Transaction(
                                    categoryname:
                                        controllerReceita.categoryname,
                                    descricao: controllerReceita.descricao,
                                    valor: controllerReceita.valor,
                                    formPag: controllerReceita.formpag,
                                    dateTime: controllerReceita.dateTime);

                                historyController.setTransAction(trans);
                                historyController.addValueCategory(
                                    controllerReceita.valor,
                                    controllerReceita.categoryname);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
