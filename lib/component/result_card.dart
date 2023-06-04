import 'package:flutter/material.dart';
import 'package:loss_of_revenue_calculator/palette.dart';
import 'package:loss_of_revenue_calculator/main.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.resultLabel,
    required this.resultAnswer,
  }) : super(key: key);

  //final String powerResult;
  final String resultAnswer;
  final String resultLabel;

  @override
  Widget build(BuildContext context) {
    if(EnergylossCalculator.themeNotifier.value == ThemeMode.light) {
      return Card(
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(30.0),
          side: const BorderSide(
            color: Colors.black, width: 2.0, style: BorderStyle.solid)),
        color: const Color(0xFFA5672B),
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //DISPLAYS THE WORD "POW" AS A STRING
              Text(resultLabel,
                style: resultTextStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 10.0,
              ),

              //THE POWER RESULT IS DISPLAYED HERE
              Text(
                resultAnswer,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),),
            ],
          ),
        ),
      );
    }
    else {
      return Card(
        shape:  RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(30.0),
            side: const BorderSide(
            color: Colors.white, width: 2.0, style: BorderStyle.solid)),
        color: const Color(0xFFA5672B),
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //DISPLAYS THE WORD "POW" AS A STRING
              Text(resultLabel,
                style: resultTextStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 10.0,
              ),

              //THE POWER RESULT IS DISPLAYED HERE
              Text(
                resultAnswer,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),),
            ],
          ),
        ),
      );

    }
  }
}
