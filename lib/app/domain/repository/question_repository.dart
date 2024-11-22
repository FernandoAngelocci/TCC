import 'package:dartz/dartz.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/infra/model/question_model.dart';
import 'package:tcc/app/usescases/question/get_questions.dart';

abstract class QuestionRepository {
  Future<Either<QuestionException, List<QuestionModel>>> getQuestions(ParamsGetQuestions params);
}
