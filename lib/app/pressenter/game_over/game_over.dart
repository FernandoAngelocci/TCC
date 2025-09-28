import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/config/const_text.dart';
import 'package:tcc/app/pressenter/cubits/questions/questions_cubit.dart';
import 'package:tcc/app/pressenter/start_page/home.dart';
import 'package:tcc/app/pressenter/widget/button.dart';

class GameOverPage extends StatefulWidget {
  const GameOverPage({super.key});

  @override
  State<GameOverPage> createState() => _GameOverPageState();
}

class _GameOverPageState extends State<GameOverPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      body: SafeArea(
        child: Center(
            child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fitHeight)),
            ),
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quizzeduca",
                    style: ConstText.title,
                  ),
                  Text(
                    "GAME-OVER",
                    style: ConstText.gameOver,
                  ),
                  Text(
                   context.watch<QuestionsCubit>().state.score.toString(),
                    style: ConstText.scoreTextStyle,
                  ),
                  ButtonHome(
                    text: 'NEW GAME',
                    onTap: () {
                      context.read<QuestionsCubit>().nextGame();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
