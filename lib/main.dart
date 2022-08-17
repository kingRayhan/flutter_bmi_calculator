import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/input_screen.dart';

void main() => runApp(const MainWidget());

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF0E1020),
          centerTitle: true,
        ),
      ),
      home: InputScreen(),
    );
  }
}
