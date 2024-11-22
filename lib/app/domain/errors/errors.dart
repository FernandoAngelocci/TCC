class UserException implements Exception {
  final String message;
  UserException({
    required this.message,
  });

  @override
  String toString() => 'UserException(message: $message)';
}
class CategorieException implements Exception {
  final String message;
  CategorieException({
    required this.message,
  });

  @override
  String toString() => 'GetListExeption(message: $message)';
}
class QuestionException implements Exception {
  final String message;
  QuestionException({
    required this.message,
  });

  @override
  String toString() => 'QuestionException(message: $message)';
}
class GetListExeption implements Exception {
  final String message;
  GetListExeption({
    required this.message,
  });

  @override
  String toString() => 'GetListExeption(message: $message)';
}
