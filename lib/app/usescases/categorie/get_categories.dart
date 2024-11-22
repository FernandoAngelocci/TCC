
import 'package:dartz/dartz.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/domain/repository/categorie_repository.dart';
import 'package:tcc/app/infra/model/user_model.dart';

abstract class IGetCategorie {
  Future<Either<CategorieException, List<CategorieModel>>> call(ParamsGetCategorie params);
}

class GetCategories implements IGetCategorie {
  CategorieRepository repository;
  GetCategories({
    required this.repository,
  });

  @override
  Future<Either<CategorieException, List<CategorieModel>>> call(ParamsGetCategorie params) async {
    return await repository.getCategories(params);
  }
}

class ParamsGetCategorie {
}
