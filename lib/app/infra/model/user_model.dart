// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tcc/app/domain/entities/categories.dart';

class CategoriesModel implements Categories {
  @override
  String description;

  @override
  int id;

  @override
  String name;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.description,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = (json['id'] as int?) ?? 0,
        description  = json['description'] as String;
}
