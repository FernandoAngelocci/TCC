
import 'package:dartz/dartz.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/domain/repository/categorie_repository.dart';
import 'package:tcc/app/infra/model/user_model.dart';

abstract class IGetCategories {
  Future<Either<CategorieException, List<CategoriesModel>>> call(ParamsGetCategories params);
}

class GetCategories implements IGetCategories {
  CategorieRepository repository;
  GetCategories({
    required this.repository,
  });

  @override
  Future<Either<CategorieException, List<CategoriesModel>>> call(ParamsGetCategories params) async {
    return await repository.getCategories(params);
  }
}

class ParamsGetCategories {
}
