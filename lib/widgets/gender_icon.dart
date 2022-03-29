import 'package:flutter/material.dart';

import '../constants.dart';

class GenderIcon extends StatelessWidget {
 
 final Icon gendericon;
 final String text;

GenderIcon({required this.gendericon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        gendericon,
        SizedBox(height: 15),
        Text(
          text,
          style: kCustomTextStyle,)
      ],
    );
  }

 
}