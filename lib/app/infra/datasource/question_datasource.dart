import 'package:tcc/app/infra/model/question_model.dart';
import 'package:tcc/app/usescases/question/get_questions.dart';

abstract class QuestionDatasource {
  Future<List<QuestionModel>> getQuestions(ParamsGetQuestions params);
}
