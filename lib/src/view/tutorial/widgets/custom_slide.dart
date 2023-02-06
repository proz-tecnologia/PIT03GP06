import 'package:ctrl_real/src/util/text_styles.dart';
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
              style: context.textStyles.textTitle,
              textAlign: TextAlign.center,
            )),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: context.textStyles.textRegular
                .copyWith(fontSize: 15, color: Colors.white),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
