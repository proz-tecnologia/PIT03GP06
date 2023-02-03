import 'package:ctrl_real/src/util/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.titulo,
    required this.irParaPaginaInicial,
  });

  final String titulo;
  final void Function() irParaPaginaInicial;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 150,
          height: 26,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0XFF382D79)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0XFF382D79)))),
            ),
            onPressed: () {
              irParaPaginaInicial();
            },
            child: Text(
              titulo,
              style: context.textStyles.textRegular
                  .copyWith(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
