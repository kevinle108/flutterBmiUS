import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
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
                    Text('Normal', style: kResultTextStyle,),
                    Text('18.3', style: kBMITextStyle,),
                    Text('Your BMI result is quite low, you should eat more!', style: kBodyTextStyle, textAlign: TextAlign.center,),
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
