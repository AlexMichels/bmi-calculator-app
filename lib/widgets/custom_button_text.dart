import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final String text;
 CustomButtonText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: kButtonTextStyle,
            
        textAlign: TextAlign.center);
  }
}
