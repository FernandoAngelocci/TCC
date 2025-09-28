import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tcc/app/config/const_colors.dart';
import 'package:tcc/app/config/const_text.dart';
import 'package:tcc/app/pressenter/start_page/home.dart';
import 'package:tcc/app/pressenter/widget/button.dart';

class GameOverPage extends StatefulWidget {
  const GameOverPage({super.key});

  @override
  State<GameOverPage> createState() => _GameOverPageState();
}

class _GameOverPageState extends State<GameOverPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      body: SafeArea(
        child: Center(
            child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fitHeight)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Text(
                  "Quizzeduca",
                  style: ConstText.title,
                ),
                Text(
                  "GAME-OVER",
                  style: ConstText.gameOver,
                ),
                ButtonHome(
                  text:  'NEW GAME',
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                  },
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
