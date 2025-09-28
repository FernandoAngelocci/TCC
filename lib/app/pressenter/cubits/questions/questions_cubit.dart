import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tcc/app/infra/model/question_model.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionState> {
  QuestionsCubit() : super(QuestionState.initial());

  final ref = FirebaseDatabase.instance.ref();

  startNewGame(List<QuestionModel> questions) {
    var remainQuestions = questions;
    remainQuestions.shuffle();
    emit(
      QuestionState(
        status: QuestionStatus.startGame,
        error: '',
        questions: questions,
        score: 0,
        currentRound: 0,
        remainQuestions: remainQuestions,
      ),
    );
    starNewRound();
  }

  score() {
    emit(
      state.copyWith(
        score: (state.score + 10),
      ),
    );
    starNewRound();
  }

  gameOver() {
    emit(state.copyWith(
      status: QuestionStatus.gameOver,
      error: '',
    ));
  }

  nextGame(){
    emit(
      state.copyWith(
        status: QuestionStatus.initial,
        error: '',
        questions: [],
        score: 0,
        currentRound: 0,
        remainQuestions: [],
        currentQuestion: null
      )
    );
  }

  play(bool isCorrect) {
    if (isCorrect) {
      score();
    } else {
      starNewRound();
    }
  }

  starNewRound() {
    var currentQuestion = state.remainQuestions?.firstOrNull;
    if (currentQuestion == null) {
      gameOver();
    }
    state.remainQuestions?.removeWhere(
        (question) => question.question == currentQuestion?.question);
    emit(state.copyWith(
      status: QuestionStatus.startNewRound,
      error: '',
      currentRound: state.currentRound + 1,
      currentQuestion: currentQuestion,
    ));
  }
}
