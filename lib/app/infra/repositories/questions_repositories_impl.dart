import 'package:dartz/dartz.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/domain/repository/question_repository.dart';
import 'package:tcc/app/infra/datasource/question_datasource.dart';
import 'package:tcc/app/infra/model/question_model.dart';
import 'package:tcc/app/usescases/question/get_questions.dart';

class QuestionsRepositoryImpl implements QuestionRepository {
  final QuestionDatasource datasource;
  QuestionsRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<QuestionException, List<QuestionModel>>> getQuestions(ParamsGetQuestions params) async {
 try {
      final categorie = await datasource.getQuestions(params);
      return Right(categorie);
    } on QuestionException catch (e) {
      return Left(e);
    } on Exception {
      return left(QuestionException(message: 'Exception Error'));
    }
  }
}
