import 'package:dartz/dartz.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/domain/repository/categorie_repository.dart';
import 'package:tcc/app/infra/datasource/user_datasource.dart';
import 'package:tcc/app/infra/model/user_model.dart';
import 'package:tcc/app/usescases/categorie/get_categories.dart';

class CategorieRepositoryImpl implements CategorieRepository {
  final CategorieDataSource datasource;
  CategorieRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<CategorieException, List<CategorieModel>>> getCategories(ParamsGetCategorie params) async {
    try {
      final categorie = await datasource.getCategorie(params);
      return Right(categorie);
    } on CategorieException catch (e) {
      return Left(e);
    } on Exception {
      return left(CategorieException(message: 'Exception Error'));
    }
  }
}
