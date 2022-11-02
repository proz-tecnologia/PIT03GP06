import 'package:ctrl_real/src/util/darkfunction.dart';
import 'package:ctrl_real/src/util/strings.dart';
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

const List<String> formlist = <String>['Dinheiro', 'Pix', 'Débito', 'Crédito'];

class DespesasPage extends StatefulWidget {
  const DespesasPage({super.key});

  @override
  State<DespesasPage> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<DespesasPage> {
  double? value;
  String values = categorieslist.first;
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
                value: values,
                elevation: 16,
                style: TextStyle(
                  color: darkFunctionTexts(),
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
                padding: const EdgeInsets.only(top: 8.0),
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
                      hintText: "Descreve sua",
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 48, 201, 43)),
                      child: const Text('Registrar'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
