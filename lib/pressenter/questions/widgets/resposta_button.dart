import 'package:flutter/material.dart';
import 'package:tcc/config/const_colors.dart';
import 'package:tcc/config/const_text.dart';

class RespostaButton extends StatelessWidget {
  const RespostaButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        width: width * 0.8,
        height: 35,
        decoration: BoxDecoration(
          color: ConstColors.buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 0,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Text(
          'A: START',
          textAlign: TextAlign.left,
          style: ConstText.styleButton,
        ),
      ),
    );
  }
}
