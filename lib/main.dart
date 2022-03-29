import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            //! Floating Action Button Color (secondary)
            secondary: Colors.purple,
          ),

          //! Backgroundcolor Scaffold
          scaffoldBackgroundColor: kScaffoldBackgroudnColor,
          //! AppBar Color
          appBarTheme: AppBarTheme(
            color: Color(0xFF0A0E21),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: InputPage());
  }
}
