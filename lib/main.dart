import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/pressenter/cubits/home_cubit/home_cubit.dart';
import 'package:tcc/app/pressenter/start_page/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<HomeCubit>(
                  create: (context) => HomeCubit(),
                ),
              ],
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Admin Panel',
                  theme: ThemeData.dark().copyWith(
                    textTheme: GoogleFonts.poppinsTextTheme(
                            Theme.of(context).textTheme)
                        .apply(bodyColor: Colors.white),
                  ),
                  home: const HomePage()),
            );
          }
          return Container(
            color: Colors.red,
          );
        });
  }
}
