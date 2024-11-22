import 'package:tcc/app/infra/model/option_model.dart';

class Questions {
  final String question;
  final int categoryID;
  final List<OptionModel> options;

  Questions({required this.question, required this.categoryID, required this.options});
}