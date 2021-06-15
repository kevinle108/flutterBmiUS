import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/reuseable_card.dart';
import 'components/round_icon_button.dart';
import 'constants.dart';

class MinusPlusCard extends StatelessWidget {
  final String unit;
  int value;
  final Function onMinus;
  final Function onPlus;

  MinusPlusCard({this.unit, this.value, this.onMinus, this.onPlus});


  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value.toString(),
                style: kNumberTextStyle,
              ),
              Text(
                unit,
                style: kLabelTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPress: onMinus,
              ),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPress: onPlus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
