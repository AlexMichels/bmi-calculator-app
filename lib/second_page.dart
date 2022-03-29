import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/custom_button_text.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String bmi;
  final String weightstatus;
  final String recommendation;

  SecondPage({required this.bmi, required this. weightstatus, required this.recommendation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Text(
            'Your Result',
            style: kCustomHeader,
          ),
        ),
        ReusableCard(
          color: kSelectedContainerColor,
          customchild: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  weightstatus.toUpperCase(),
                  style: TextStyle(
                      color: kBottomContainer,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                )), Center(
                    child: Text(
                  bmi,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 85,
                      fontWeight: FontWeight.bold),
                )),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: Text(
                  recommendation,
                  style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.normal), textAlign: TextAlign.center,
                ),
                    )), 
              ]),
        ),
        SizedBox(height:10),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 13.0),
              child: Center(child: CustomButtonText(text: 'RE-CALCULATE')),
            ),
            height: 70,
            width: double.infinity,
            color: kBottomContainer,
          ),
        )
      ]),
    );
  }
}
