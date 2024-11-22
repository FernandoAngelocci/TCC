import 'package:firebase_database/firebase_database.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/infra/datasource/user_datasource.dart';
import 'package:tcc/app/infra/model/user_model.dart';
import 'package:tcc/app/usescases/categorie/get_categories.dart';

class CategorieFirebase implements CategorieDataSource {
  final DatabaseReference  firebase;

  CategorieFirebase({required this.firebase});

  @override
  Future<List<CategorieModel>> getCategorie(ParamsGetCategorie params) async {
    try {
       final snapshot = await firebase.child('categories').get();
    if (snapshot.exists) {
        return (snapshot.value as List)
            .map((category) => CategorieModel.fromJson(Map<String, dynamic>.from(category)))
            .toList();
    } else {
      throw CategorieException(message: "Vazio");
    }
    }catch(e){
      throw CategorieException(message: "Erro ao consultar");
    }
   
  }
}
