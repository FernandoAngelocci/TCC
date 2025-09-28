import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/domain/external/firebase/login_data_mock.dart';
import 'package:tcc/app/domain/external/firebase/question_firebase.dart';
import 'package:tcc/app/infra/model/question_model.dart';
import 'package:tcc/app/infra/model/user_model.dart';
import 'package:tcc/app/infra/repositories/categorie_repositories_impl.dart';
import 'package:tcc/app/infra/repositories/questions_repositories_impl.dart';
import 'package:tcc/app/usescases/categorie/get_categories.dart';
import 'package:tcc/app/usescases/question/get_questions.dart';

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

  starNewRound() {
    var currentQuestion = state.remainQuestions?.first;
    state.remainQuestions?.removeWhere((question) => question.question == currentQuestion?.question);
    emit(
      QuestionState(
          status: QuestionStatus.startNewRound,
          error: '',
          currentRound: state.currentRound + 1,
          currentQuestion: currentQuestion,
      ),
    );
  }
}
