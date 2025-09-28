import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/config/const_text.dart';
import 'package:tcc/app/pressenter/cubits/questions/questions_cubit.dart';
import 'package:tcc/app/pressenter/questions/widgets/resposta_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late Timer _timer;
  double progressionBar = 1;
  double _start = 15;

  void startTimer() {
    const oneSec = Duration(milliseconds: 1000);
    _timer = Timer.periodic(
      oneSec,
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
        if(state.status == QuestionStatus.startNewRound){
          startTimer();
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
                    builder: (context, state) => SizedBox(
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
                                    'A: ${state.currentQuestion?.options[0].option.toUpperCase()}',
                                answer: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AnswerButton(
                                question:
                                    'B: ${state.currentQuestion?.options[1].option.toUpperCase()}',
                                answer: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AnswerButton(
                                question:
                                    'C: ${state.currentQuestion?.options[2].option.toUpperCase()}',
                                answer: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AnswerButton(
                                question:
                                    'D: ${state.currentQuestion?.options[3].option.toUpperCase()}',
                                answer: () {},
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
