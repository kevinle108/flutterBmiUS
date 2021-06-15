import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/minus_plus_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../components/round_icon_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int weight = 140;
  int feet = 3;
  int inches = 0;
  // int feet = 3;
  // int inches = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: (selectedGender == Gender.male)
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    iconData: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                )),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: (selectedGender == Gender.female)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'lbs',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                    value: weight.toDouble(),
                    min: 80.0,
                    max: 200.0,
                    onChanged: (double newValue) {
                      setState(() {
                        weight = newValue.toInt();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MinusPlusCard(
                  unit: 'ft',
                  value: feet,
                  onMinus: () {
                    setState(() {
                      if (feet > 0) feet--;
                    });
                  },
                  onPlus: () {
                    setState(() {
                      feet++;
                    });
                  },
                )),
                Expanded(
                  child: MinusPlusCard(
                    unit: 'in',
                    value: inches,
                    onMinus: () {
                      setState(() {
                        if (inches > 1) inches--;
                      });
                    },
                    onPlus: () {
                      setState(() {
                        inches++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: weight, weight: feet);
                // Navigator.pushNamed(context, '/results');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(calcBrain: calc),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
