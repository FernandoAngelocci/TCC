import 'package:flutter/material.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/config/const_text.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.question, required this.answer});
  final String question;
  final Function()? answer;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: answer,
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
          question,
          textAlign: TextAlign.left,
          style: ConstText.styleButton,
        ),
      ),
    );
  }
}
