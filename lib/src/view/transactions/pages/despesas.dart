import 'package:ctrl_real/src/controllers/transactions_controller.dart';
import 'package:ctrl_real/src/controllers/xplvl_system_controller.dart';
import 'package:ctrl_real/src/model/totallandcategory_model.dart';
import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../../controllers/transactions_form_controller.dart';

class DespesasPage extends StatefulWidget {
  const DespesasPage({super.key});

  @override
  State<DespesasPage> createState() => _AddCategoriesState();
}

final TransactionController controller = TransactionController();

final _txtDateTimeController = TextEditingController();

class _AddCategoriesState extends State<DespesasPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(220, 104, 89, 205),
                        ),
                      ),
                    ),
                    hint: Text(
                      Strings.nameImputCategoriesForm,
                      style: TextStyle(
                        color: darkFunctionTexts(),
                      ),
                    ),
                    validator: (value) {
                      if (value == '' || value == null) {
                        return "Informe uma categoria";
                      }
                      return null;
                    },
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
                        hintText: "Descreva sua compra",
                        hintStyle: const TextStyle(fontSize: 12),
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
                        controller.descricao = value;
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
                        labelText: Strings.nameImputValorForm,
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: darkFunctionTexts(),
                        ),
                        hintText: "0,00",
                        hintStyle: const TextStyle(fontSize: 12),
                        prefix: const Text("R\$"),
                        helperText: "Máximo de 999.999,99 digitos",
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(220, 104, 89, 205),
                          ),
                        ),
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
                    padding: const EdgeInsets.only(top: 16),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(220, 104, 89, 205),
                          ),
                        ),
                      ),
                      hint: Text(
                        Strings.nameImputPaymentForm,
                        style: TextStyle(
                          color: darkFunctionTexts(),
                        ),
                      ),
                      elevation: 16,
                      style: TextStyle(
                        color: darkFunctionTexts(),
                      ),
                      onChanged: (a) {
                        controller.formpag = a ?? '';
                        setState(() {});
                      },
                      items: controller.formlist
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
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
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 360)),
                          lastDate: DateTime.now(),
                          initialDate: controller.dateTime);
                      controller.dateTime = date ?? controller.dateTime;
                      _txtDateTimeController.text =
                          "${controller.dateTime.day}/${controller.dateTime.month}/${controller.dateTime.year}";
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Center(
                      child: SizedBox(
                        width: 130,
                        height: 40,
                        child: Consumer2<TransactionsController, LvlSystem>(
                          builder: (context, historyController, lvlsystem, _) {
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
                                  var trans = TotalandCategory(
                                    id: const Uuid().v4(),
                                    date: _txtDateTimeController.text,
                                    type: 'Despesa',
                                    valor: controller.valor,
                                    descri: controller.descricao,
                                    categoryname: controller.categoryname,
                                    formPag: 'Forma: ${controller.formpag}',
                                    /*icon: const Icon(
                                      Icons.arrow_downward_outlined,
                                      color: Colors.red,
                                    ),*/
                                  );
                                  historyController.addTotaltransection(trans);
                                  historyController.addValueCategory(
                                      controller.valor,
                                      controller.categoryname);
                                  historyController.addsaidafire(controller.valor);
                                  historyController
                                      .atualizarLimite(controller.valor);
                                  historyController
                                      .porcentAtualizardisp(controller.valor);
                                  lvlsystem.despXpAdd();
                                  lvlsystem.xpFinal();
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
