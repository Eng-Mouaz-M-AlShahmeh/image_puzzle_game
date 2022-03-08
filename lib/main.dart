/* Developed by: Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_puzzle_game/page/pick_image.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "أحجية الصورة",
        theme: ThemeData.light(),
        home: const Scaffold(
          body: PickImage(),
        ));
  }
}
