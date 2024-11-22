import 'package:tcc/app/domain/entities/option.dart';

class OptionModel implements Option {
  @override
  bool isCorrect;

  @override
  String option;

  OptionModel({
    required this.option,
    required this.isCorrect,
  });

  OptionModel.fromJson(Map<String, dynamic> json)
      : option = json['text'] as String,
        isCorrect = json['isCorrect'] as bool;
}
