import 'package:firebase_database/firebase_database.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/infra/datasource/question_datasource.dart';
import 'package:tcc/app/infra/model/question_model.dart';
import 'package:tcc/app/usescases/question/get_questions.dart';

class QuestionFirebase implements QuestionDatasource {
  final DatabaseReference firebase;

  QuestionFirebase({required this.firebase});

  @override
  Future<List<QuestionModel>> getQuestions(ParamsGetQuestions params) async {
    try {
      final snapshot = await firebase.child('questions').get();
      if (snapshot.exists) {
        return (snapshot.value as List)
            .map((question) =>
                QuestionModel.fromJson(Map<String, dynamic>.from(question)))
            .toList();
      } else {
        throw QuestionException(message: "Vazio");
      }
    } catch (e) {
      throw QuestionException(message: "Erro ao consultar");
    }
  }
}
