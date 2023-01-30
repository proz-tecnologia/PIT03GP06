import 'package:flutter/material.dart';

@immutable
class CustomSlide extends StatelessWidget {
  const CustomSlide({
    super.key,
    required this.imagem,
    required this.titulo,
    required this.texto,
  });

  final String imagem;
  final String titulo;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Image.asset(
          imagem,
          width: 300,
          height: 220,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                child: Text(
              titulo,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
