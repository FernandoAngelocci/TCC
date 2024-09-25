import 'package:flutter/material.dart';
import 'package:tcc/config/const_colors.dart';
import 'package:tcc/pressenter/questions/question_page.dart';
import 'package:tcc/pressenter/widget/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
              child: Image.asset('assets/background_home.png'),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Center(child: ButtonHome(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionPage()),
                  );
                },
              )),
            ),
          ],
        ),
      )),
    );
  }
}
