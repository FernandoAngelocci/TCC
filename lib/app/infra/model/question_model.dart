import 'package:tcc/app/domain/entities/questions.dart';
import 'package:tcc/app/infra/model/option_model.dart';

class QuestionModel implements Questions{
  @override
  final int  categoryID;

  @override
  final List<OptionModel>  options;

  @override
  final String  question;

  QuestionModel({required this.categoryID, required this.options, required this.question});

  QuestionModel.fromJson(Map<String, dynamic> json)
      : categoryID = (json['categoryId'] as int?) ?? 0,
        question = json['question'] as String,
        options  = (json['options'] as List).map((option) => OptionModel.fromJson(Map<String, dynamic>.from(option))).toList();
}