import 'package:ctrl_real/src/controllers/themes/darmodcontroller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class ReceitasPage extends StatefulWidget {
  const ReceitasPage({super.key});

  @override
  State<ReceitasPage> createState() => _ReceitasPageState();
}

class _ReceitasPageState extends State<ReceitasPage> {
  double? value;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      locale: Locale("pt", "BR"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  "Informe a data",
                  style: TextStyle(
                    color: DarkController.instance.darkmod
                        ? const Color.fromARGB(207, 255, 255, 255)
                        : const Color.fromARGB(220, 104, 89, 205),
                  ),
                ),
              ),
              IconButton(
                onPressed: _showDatePicker,
                icon: Icon(Icons.date_range,
                    color: const Color.fromARGB(220, 104, 89, 205)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
    ;
  }
}
