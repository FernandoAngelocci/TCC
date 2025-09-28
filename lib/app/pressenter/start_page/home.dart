import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/config/const_text.dart';
import 'package:tcc/app/pressenter/cubits/home_cubit/home_cubit.dart';
import 'package:tcc/app/pressenter/cubits/questions/questions_cubit.dart';
import 'package:tcc/app/pressenter/questions/question_page.dart';
import 'package:tcc/app/pressenter/widget/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeCubit>().getCategories();
    context.read<HomeCubit>().getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
          child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.fitHeight)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "Quizzeduca",
                    style: ConstText.title,
                  ),
                ),
              )),
              BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                return Expanded(
                  flex: 2,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: state.categories.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<HomeCubit>()
                                .selectCategories(state.categories[index]);
                          },
                          child: Container(
                            width: 200,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ConstColors.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: state.selectedCategories
                                          .contains(state.categories[index])
                                      ? Colors.black
                                      : Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Text(
                              state.categories[index].name,
                              style: ConstText.categorieButton,
                            ),
                          ),
                        );
                      }),
                );
              }),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Center(child: ButtonHome(
                  onTap: () {
                    context.read<QuestionsCubit>().startNewGame(context
                        .read<HomeCubit>()
                        .state
                        .questions
                        .where((question) => context
                            .read<HomeCubit>()
                            .state
                            .selectedCategories
                            .where((category) =>
                                category.id == question.categoryID).isNotEmpty)
                        .toList());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuestionPage()),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
