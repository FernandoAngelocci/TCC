import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/config/const_text.dart';
import 'package:tcc/app/pressenter/cubits/questions/questions_cubit.dart';
import 'package:tcc/app/pressenter/questions/widgets/resposta_button.dart';

import 'package:tcc/app/pressenter/game_over/game_over.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late final Timer _timer = Timer.periodic(
    const Duration(milliseconds: 1000),
        (Timer timer) {
      if (_start == 0) {
        setState(() {
          context.read<QuestionsCubit>().starNewRound();
        });
      } else {
        setState(() {
          progressionBar -= 0.07;
          _start--;
        });
      }
    },
  );
  double progressionBar = 1;
  double _start = 15;

  void startTimer() {
    _start = 15;
    progressionBar = 1;
    _timer;
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionsCubit, QuestionState>(
      listener: (context, state) {
        if (state.status == QuestionStatus.startNewRound) {
          startTimer();
        }
        if (state.status == QuestionStatus.gameOver) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GameOverPage()),
          );
        }
      },
      child: Scaffold(
          backgroundColor: ConstColors.primaryColor,
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _start.toString(),
                    style: ConstText.timer,
                  ),
                  SizedBox(
                    width: 300,
                    height: 30,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.red,
                      valueColor: const AlwaysStoppedAnimation(Colors.green),
                      value: progressionBar,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  BlocBuilder<QuestionsCubit, QuestionState>(
                    builder: (context, state) =>
                        SizedBox(
                            height: 600,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                    child: Center(
                                      child: Text(
                                        state.currentQuestion?.question ?? "",
                                        style: ConstText.question,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnswerButton(
                                    question:
                                    'A: ${state.currentQuestion?.options[0]
                                        .option.toUpperCase()}',
                                    answer: () {
                                      context.read<QuestionsCubit>().play(state.currentQuestion?.options[0]
                                          .isCorrect ?? false);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnswerButton(
                                    question:
                                    'B: ${state.currentQuestion?.options[1]
                                        .option.toUpperCase()}',
                                    answer: () {
                                      context.read<QuestionsCubit>().play(state.currentQuestion?.options[1]
                                          .isCorrect ?? false);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnswerButton(
                                    question:
                                    'C: ${state.currentQuestion?.options[2]
                                        .option.toUpperCase()}',
                                    answer: () {
                                      context.read<QuestionsCubit>().play(state.currentQuestion?.options[2]
                                          .isCorrect ?? false);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnswerButton(
                                    question:
                                    'D: ${state.currentQuestion?.options[3]
                                        .option.toUpperCase()}',
                                    answer: () {
                                      context.read<QuestionsCubit>().play(state.currentQuestion?.options[3]
                                          .isCorrect ?? false);
                                    },
                                  ),
                                ),
                              ],
                            )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
