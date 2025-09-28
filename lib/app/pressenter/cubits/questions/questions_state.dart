// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'questions_cubit.dart';

enum QuestionStatus {
  initial,
  startGame,
  startNewRound,
  gameOver,
  completed,
  error,
  loading
}

class QuestionState extends Equatable {
  final QuestionStatus status;
  final String error;
  final List<QuestionModel>? questions;
  final List<QuestionModel>? remainQuestions;
  final int? score;
  final int currentRound;
  final QuestionModel? currentQuestion;

  final quantityTotalRounds = 10;
  final roundTime = 15;

  const QuestionState({
    required this.status,
    required this.error,
    this.questions,
    this.score,
    required this.currentRound,
    this.remainQuestions,
    this.currentQuestion,
  });

  factory QuestionState.initial() {
    return const QuestionState(
      status: QuestionStatus.initial,
      error: '',
      questions: [],
      score: 0,
      currentRound: 0,
      remainQuestions: [],
    );
  }

  QuestionState copyWith({
    QuestionStatus? status,
    String? error,
    List<QuestionModel>? questions,
    int? score,
    int? currentRound,
    List<QuestionModel>? remainQuestions,
    QuestionModel? currentQuestion,
  }) {
    return QuestionState(
      status: status ?? this.status,
      error: error ?? this.error,
      questions: questions ?? this.questions,
      score: score ?? this.score,
      currentRound: currentRound ?? this.currentRound,
      remainQuestions: remainQuestions ?? this.remainQuestions,
      currentQuestion: currentQuestion ?? this.currentQuestion,
    );
  }

  @override
  List<Object> get props => [
        status,
        error,
        questions ?? [],
        score ?? 0,
        currentRound,
        remainQuestions ?? [],
        currentQuestion ?? 'No Question'
      ];

  @override
  bool get stringify => true;
}
