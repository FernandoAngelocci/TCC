import 'package:flutter/material.dart';
import 'package:tcc/config/const_colors.dart';
import 'package:tcc/config/const_text.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({super.key, this.onTap});

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 35,
        decoration: BoxDecoration(
          color: ConstColors.buttonColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 0,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'START',
            style: ConstText.styleButton,
          ),
        ),
      ),
    );
  }
}
