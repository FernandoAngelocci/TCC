import 'package:dartz/dartz.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/infra/model/user_model.dart';
import 'package:tcc/app/usescases/categorie/get_categories.dart';

abstract class CategorieRepository {
  Future<Either<CategorieException, List<CategorieModel>>> getCategories(ParamsGetCategorie params);
}
