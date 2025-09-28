// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStatus { initial, completed, error, loading }

class HomeState extends Equatable {
  final HomeStatus status;
  final String error;
  final List<CategoriesModel> categories;
  final List<QuestionModel> questions;
  final List<CategoriesModel> selectedCategories;

  const HomeState({
    required this.status,
    required this.error,
    required this.categories,
    required this.selectedCategories,
    required this.questions,
  });

  factory HomeState.initial() {
    return const HomeState(
      status: HomeStatus.initial,
      error: '',
      categories: [],
      selectedCategories: [],
      questions: []
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    String? error,
    List<CategoriesModel>? categories,
    List<CategoriesModel>? selectedCategories,
    List<QuestionModel>? questions
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      categories: categories ?? this.categories,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      questions: questions ?? this.questions
    );
  }

  @override
  List<Object> get props => [status, error, categories, selectedCategories, questions];

  @override
  bool get stringify => true;
}
