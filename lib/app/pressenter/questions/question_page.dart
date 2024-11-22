import 'package:flutter/material.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/pressenter/questions/widgets/resposta_button.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
              child: Image.asset('assets/balao.png'),
            )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: RespostaButton(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: RespostaButton(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: RespostaButton(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: RespostaButton(),
            ),
          ],
        ),
      ),
    );
  }
}
