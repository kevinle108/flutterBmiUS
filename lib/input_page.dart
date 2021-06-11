import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
              children: [
                Expanded(
                  child: ReusableCard(color: Color(0xFF1D1E33),)
                ),
                Expanded(
                  child: ReusableCard(color: Color(0xFF1D1E33),),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(color: Color(0xFF1D1E33),)
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: Color(0xFF1D1E33),)
                ),
                Expanded(
                  child: ReusableCard(color: Color(0xFF1D1E33),)
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            height: 80.0,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  ReusableCard({this.color});

  // Color(0xFF1D1E33)
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}


