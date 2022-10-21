import 'package:flutter/material.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

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
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Valor',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(220, 104, 89, 205),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(220, 104, 89, 205))))),
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
