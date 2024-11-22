
import 'package:dartz/dartz.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/domain/repository/question_repository.dart';
import 'package:tcc/app/infra/model/question_model.dart';

abstract class IGetQuestions {
  Future<Either<QuestionException, List<QuestionModel>>> call(ParamsGetQuestions params);
}

class GetQuestions implements IGetQuestions {
  QuestionRepository repository;
  GetQuestions({
    required this.repository,
  });

  @override
  Future<Either<QuestionException, List<QuestionModel>>> call(ParamsGetQuestions params) async {
    return await repository.getQuestions(params);
  }
}

class ParamsGetQuestions {
}
