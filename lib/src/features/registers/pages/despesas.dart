import 'dart:ui';

import 'package:ctrl_real/src/controllers/providercontrolers/history_page_controller.dart';
import 'package:ctrl_real/src/model/transections_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/providercontrolers/transections_controller.dart';

const List<String> formlist = <String>['Dinheiro', 'Pix', 'Débito', 'Crédito'];

class DespesasPage extends StatefulWidget {
  const DespesasPage({super.key});

  @override
  State<DespesasPage> createState() => _AddCategoriesState();
}

final TransactionController controller = TransactionController();

class _AddCategoriesState extends State<DespesasPage> {
  final _formKey = GlobalKey<FormState>();
  String form = formlist.first;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      locale: const Locale("pt", "BR"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 38.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Strings.nameImputCategoriesForm,
                  style: TextStyle(
                    color: darkFunctionTexts(),
                  ),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: controller.categoryname,
                  elevation: 16,
                  style: TextStyle(
                    color: darkFunctionTexts(),
                  ),
                  onChanged: (a) {
                    controller.categoryname = a ?? '';
                    setState(() {});
                  },
                  items: controller.categoryList
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
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
                      labelText: Strings.nameImputDescriptionForm,
                      hintText: "Descreva sua compra",
                      hintStyle: TextStyle(fontSize: 12),
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: darkFunctionTexts(),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(220, 104, 89, 205),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      controller.descri = value;
                    },
                  ),
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
                        fontSize: 14,
                        color: darkFunctionTexts(),
                      ),
                      hintText: "0,00",
                      hintStyle: TextStyle(fontSize: 12),
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
                    onChanged: (value) {
                      controller.valor = double.parse(
                          value.replaceAll(".", "").replaceAll(",", "."));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    Strings.nameImputPaymentForm,
                    style: TextStyle(
                      color: darkFunctionTexts(),
                    ),
                  ),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: form,
                  elevation: 16,
                  style: TextStyle(
                    color: darkFunctionTexts(),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      form = value!;
                    });
                  },
                  items: formlist.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                IconButton(
                  onPressed: _showDatePicker,
                  icon: Icon(
                    Icons.date_range,
                    color: darkFunctionTexts(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
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
                                      duration: Duration(seconds: 1),
                                      backgroundColor:
                                          Color.fromARGB(220, 104, 89, 205),
                                      content: Text(
                                        'Registrado!',
                                        textAlign: TextAlign.center,
                                      )),
                                );
                                var trans = Transaction(
                                    valor: controller.valor,
                                    descri: controller.descri,
                                    categoryname: controller.categoryname,
                                    formPag: controller.formpag);
                                historyController.setTransAction(trans);
                                controller.categoryname == 'Supermercado'
                                    ? historyController.supermerc +=
                                        controller.valor
                                    : controller.categoryname == 'Lazer'
                                        ? historyController.lazer +=
                                            controller.valor
                                        : controller.categoryname ==
                                                'Transporte'
                                            ? historyController.transpor +=
                                                controller.valor
                                            : controller.categoryname ==
                                                    'Farmacia'
                                                ? historyController.farmac +=
                                                    controller.valor
                                                : controller.categoryname ==
                                                        'Pagamentos'
                                                    ? historyController
                                                            .pagament +=
                                                        controller.valor
                                                    : historyController
                                                            .gastosex +=
                                                        controller.valor;
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
