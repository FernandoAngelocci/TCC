import 'package:tcc/app/infra/model/user_model.dart';
import 'package:tcc/app/usescases/categorie/get_categories.dart';

abstract class CategorieDataSource {
  Future<List<CategoriesModel>> getCategorie(ParamsGetCategories params);
}
