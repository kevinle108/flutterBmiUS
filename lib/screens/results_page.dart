import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final CalculatorBrain calcBrain;

  ResultsPage({@required this.calcBrain});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Your Result',
                      style: kTitleTextStyle,
                    ))),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(calcBrain.getResult().toUpperCase(), style: kResultTextStyle,),
                    Text(calcBrain.calculateBMI(), style: kBMITextStyle,),
                    Text(calcBrain.getInterpretation(), style: kBodyTextStyle, textAlign: TextAlign.center,),
                    BottomButton(buttonTitle: 'RE-CALCULATE', onTap: () {
                      Navigator.pop(context);
                    })
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
