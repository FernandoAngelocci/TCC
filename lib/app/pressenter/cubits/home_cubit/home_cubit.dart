import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tcc/app/domain/errors/errors.dart';
import 'package:tcc/app/domain/external/firebase/login_data_mock.dart';
import 'package:tcc/app/domain/external/firebase/question_firebase.dart';
import 'package:tcc/app/infra/model/question_model.dart';
import 'package:tcc/app/infra/model/user_model.dart';
import 'package:tcc/app/infra/repositories/categorie_repositories_impl.dart';
import 'package:tcc/app/infra/repositories/questions_repositories_impl.dart';
import 'package:tcc/app/usescases/categorie/get_categories.dart';
import 'package:tcc/app/usescases/question/get_questions.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  final ref = FirebaseDatabase.instance.ref();

  void selectCategories(CategoriesModel categories) {
    List<CategoriesModel> newCategories = [];
    newCategories.addAll(state.selectedCategories);

    if (newCategories.contains(categories)) {
      newCategories.remove(categories);
    } else {
      newCategories.add(categories);
    }

    emit(state.copyWith(
      status: HomeStatus.completed,
      selectedCategories: newCategories,
    ));
  }

  void getCategories() async {
    emit(
      state.copyWith(status: HomeStatus.loading),
    );
    final result = await GetCategories(
            repository: CategorieRepositoryImpl(
                datasource: CategorieFirebase(firebase: ref)))
        .call(
      ParamsGetCategories(),
    );

    result.fold(
        (CategorieException exception) => {
              emit(state.copyWith(
                status: HomeStatus.error,
              ))
            },
        (List<CategoriesModel> categories) => {
              emit(state.copyWith(
                status: HomeStatus.completed,
                categories: categories,
              ))
            });
  }

  void getQuestions() async {
    emit(
      state.copyWith(status: HomeStatus.loading),
    );
    final result = await GetQuestions(
            repository: QuestionsRepositoryImpl(
                datasource: QuestionFirebase(firebase: ref)))
        .call(
      ParamsGetQuestions(),
    );

    result.fold(
        (QuestionException exception) => {
              emit(state.copyWith(
                status: HomeStatus.error,
              ))
            },
        (List<QuestionModel> questions) => {
              emit(state.copyWith(
                status: HomeStatus.completed,
                questions: questions,
              ))
            });
  }
}
