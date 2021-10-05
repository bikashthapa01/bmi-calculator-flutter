import 'package:bmi_app/bmi_calculator.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:bmi_app/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../constants.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;
  double _currentSliderValue = 100;
  double _currentWeightValue = 50;
  double _currentAgeValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                        label: "Male", cardIcon: FontAwesomeIcons.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                        label: "Female", cardIcon: FontAwesomeIcons.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(_currentSliderValue.toInt().toString(),
                          style: kCardNumberStyle),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.pink,
                      overlayColor: const Color(0x29FFC0CB),
                      inactiveTrackColor: Colors.white38,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25.0),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 210,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _currentWeightValue.toInt().toString(),
                          style: kCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.white24,
                              onPressed: () {
                                setState(() {
                                  _currentWeightValue > 0
                                      ? _currentWeightValue--
                                      : _currentWeightValue = 0;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.black54,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.white24,
                              onPressed: () {
                                setState(() {
                                  _currentWeightValue++;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _currentAgeValue.toInt().toString(),
                          style: kCardNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.white24,
                              onPressed: () {
                                setState(() {
                                  _currentAgeValue > 0
                                      ? _currentAgeValue--
                                      : _currentAgeValue = 0;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.black54,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.white24,
                              onPressed: () {
                                setState(() {
                                  _currentAgeValue++;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE YOUR BMI',
            onButtonTap: () {
              BmiCalculator calc = BmiCalculator(
                  height: _currentSliderValue.toInt(),
                  weight: _currentWeightValue.toInt());
              // start new page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                        bmiResult: calc.calculateBMI(),
                        result: calc.getResult(),
                        message: calc.getMessage());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
