import 'package:flutter/material.dart';

// creating Stateless Widget for buttons
class CalculatorButton extends StatelessWidget {

// declaring variables
  final color;
  final textColor;
  final buttonText;
  final buttontapped;

//Constructor
  CalculatorButton({this.color, this.textColor, this.buttonText, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
