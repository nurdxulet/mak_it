import 'package:flutter/material.dart';
import 'package:mak_it/screens/error_screen.dart';
import 'package:mak_it/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<int, Color> primaryColorMap = {
    50: const Color.fromRGBO(130, 130, 130, .1),
    200: const Color.fromRGBO(130, 130, 130, .3),
    300: const Color.fromRGBO(130, 130, 130, .4),
    400: const Color.fromRGBO(130, 130, 130, .5),
    100: const Color.fromRGBO(130, 130, 130, .2),
    500: const Color.fromRGBO(130, 130, 130, .6),
    600: const Color.fromRGBO(130, 130, 130, .7),
    700: const Color.fromRGBO(130, 130, 130, .8),
    800: const Color.fromRGBO(130, 130, 130, .9),
    900: const Color.fromRGBO(130, 130, 130, 1),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff828282, primaryColorMap),
      ),
      home: LogInScreen(),
    );
  }
}
