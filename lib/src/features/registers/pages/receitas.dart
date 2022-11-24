import 'package:ctrl_real/src/controllers/providercontrolers/registers_transections_controller.dart';
import 'package:ctrl_real/src/model/registers_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/providercontrolers/transections_despe_controller.dart';

class ReceitasPage extends StatefulWidget {
  const ReceitasPage({super.key});

  @override
  State<ReceitasPage> createState() => _ReceitasPageState();
}

final TransactionController controller = TransactionController();

class _ReceitasPageState extends State<ReceitasPage> {
  final _formKey = GlobalKey<FormState>();

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Receitas'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
            child: Form(
              key: _formKey,
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
                      maxLength: 52,
                      validator: (value) {
                        if (value!.length < 3 || value.length > 52) {
                          return "Informe uma descrição";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        helperText: "Campo obrigatório",
                        labelText: Strings.nameImputDescriptionForm,
                        hintText: "Hora extra...",
                        hintStyle: TextStyle(fontSize: 12),
                        labelStyle: TextStyle(
                          color: darkFunctionTexts(),
                          fontSize: 14,
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
                          color: darkFunctionTexts(),
                          fontSize: 14,
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
                      onChanged: ((newValue) => controller.valor = double.parse(
                          newValue.replaceAll(".", "").replaceAll(",", "."))),
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
                  IconButton(
                    onPressed: _showDatePicker,
                    icon: Icon(
                      Icons.date_range,
                      color: darkFunctionTexts(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: SizedBox(
                        width: 130,
                        height: 40,
                        child: Consumer<HistoryController>(
                          builder: (context, historyController, __) {
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
                                  var trans = TotalandCategory(
                                      type: 'Receita',
                                      valor: controller.valor,
                                      descri: controller.descri,
                                      formPag: 'Ganho',
                                      icon: const Icon(
                                        Icons.arrow_upward_outlined,
                                        color: Colors.green,
                                      ));
                                  historyController.addTotaltransection(trans);
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
      ),
    );
  }
}
