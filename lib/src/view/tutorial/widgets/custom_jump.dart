import 'package:flutter/material.dart';

class CustomJump extends StatelessWidget {
  const CustomJump(
      {super.key, required this.titulo, required this.irParaPaginaInicial});

  final String titulo;
  final void Function() irParaPaginaInicial;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            irParaPaginaInicial();
          },
          child: Text(
            titulo,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
