// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tcc/app/domain/entities/categories.dart';

class CategorieModel implements Categorie {
  @override
  String description;

  @override
  int id;

  @override
  String name;

  CategorieModel({
    required this.id,
    required this.name,
    required this.description,
  });

  CategorieModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = (json['id'] as int?) ?? 0,
        description  = json['description'] as String;
}
