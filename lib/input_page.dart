import 'package:bmi_calculator/application.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/second_page.dart';
import 'package:bmi_calculator/widgets/custom_button_text.dart';
import 'package:bmi_calculator/widgets/custom_flowting_button.dart';
import 'package:bmi_calculator/widgets/gender_icon.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Colors for easier adjustments of the App.

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kUnselectedContainerColor;
  Color femaleColor = kUnselectedContainerColor;
  Gender? gender;

  int slidervalue = 180;
  int weight = 70;
  int age = 19;

  void ColorChanger(Gender gender) {
    gender == Gender.male
        ? maleColor = kSelectedContainerColor
        : maleColor = kUnselectedContainerColor;
    gender == Gender.female
        ? femaleColor = kSelectedContainerColor
        : femaleColor = kUnselectedContainerColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                ReusableCard(
                    onPressed: () {
                      setState(() {
                        ColorChanger(Gender.male);
                      });
                    },
                    customchild: GenderIcon(
                      gendericon: Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      text: 'MALE',
                    ),
                    color: maleColor),
                ReusableCard(
                    onPressed: () {
                      setState(() {
                        ColorChanger(Gender.female);
                      });
                    },
                    customchild: GenderIcon(
                      gendericon: Icon(FontAwesomeIcons.venus, size: 80),
                      text: 'FEMALE',
                    ),
                    color: femaleColor)
              ])),
          ReusableCard(
              customchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'HEIGHT',
                    style: kCustomTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(slidervalue.toString(), style: kCustomNumber),
                      SizedBox(width: 2),
                      Text(
                        'cm',
                        style: kCustomTextStyle,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey[500],
                          thumbColor: kBottomContainer,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayColor: kBottomContainer.withAlpha(0x1f),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          trackHeight: 1),
                      child: Slider(
                          //activeColor: kBottomContainer,
                          //inactiveColor: kScaffoldBackgroudnColor,
                          min: 130.0,
                          max: 220.0,
                          value: slidervalue.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              slidervalue = value.round();
                            });
                          }),
                    ),
                  )
                ],
              ),
              color: Color(0xFF1D1E33)),
          Expanded(
              child: Row(children: [
            ReusableCard(
              customchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kCustomTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kCustomNumber,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomActionButton(
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                          color: Color(0xFF4c4f5e),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomActionButton(
                          onPress: () {
                            setState(() {
                              weight++;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                          color: Color(0xFF4c4f5e),
                        )
                      ],
                    )
                  ]),
              color: kSelectedContainerColor,
            ),
            ReusableCard(
              color: kSelectedContainerColor,
              customchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kCustomTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kCustomNumber,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomActionButton(
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                          color: Color(0xFF4c4f5e),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomActionButton(
                          onPress: () {
                            setState(() {
                              age++;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                          color: Color(0xFF4c4f5e),
                        )
                      ],
                    )
                  ]),
            )
          ])),
          GestureDetector(
            onTap: () {
              ApplicationBrain calc =
                  ApplicationBrain(weight: weight, height: slidervalue);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(
                            bmi: calc.bmiCalculation(),
                            recommendation: calc.getRecommendation(),
                            weightstatus: calc.getWeightstatus(),
                          )));
            },
            child: Container(
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: CustomButtonText(
                        text: 'CALCULATE',
                      ))),
              color: kBottomContainer,
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
            ),
          )
        ],
      ),
    );
  }
}
