import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

import 'package:loss_of_revenue_calculator/landscape.dart';
import 'package:loss_of_revenue_calculator/component/calculator_btn.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var userInput = '';
  var answer = '';

  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  // function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toStringAsFixed(2);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar:
        AppBar(
          // actions: [
          //   IconButton(
          //       icon: Icon(
          //           EnergylossCalculator.themeNotifier.value == ThemeMode.light
          //               ? Icons.dark_mode
          //               : Icons.light_mode),
          //       onPressed: () {
          //         EnergylossCalculator.themeNotifier.value =
          //         EnergylossCalculator.themeNotifier.value ==
          //             ThemeMode.dark
          //             ? ThemeMode.light
          //             : ThemeMode.dark;
          //       })
          // ],

          title: const Center(child: Text('CALCULATOR',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFFA5672B),
            ),
          ),
          ),
        ),

        body:

        OrientationBuilder(
            builder: (context, orientation) {
              if (MediaQuery
                  .of(context)
                  .orientation == Orientation.landscape) {
                return const LandscapeView();
              } else {
                return SafeArea(
                  maintainBottomViewPadding: true,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    userInput,
                                    style: const TextStyle(
                                        fontSize: 18, color: Color(0xFFA5672B),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    answer,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        color: Color(0xFFA5672B),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: GridView.builder(
                            itemCount: buttons.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                            itemBuilder: (BuildContext context, int index) {
                              // Clear Button
                              if (index == 0) {
                                return CalculatorButton(
                                  buttontapped: () {
                                    setState(() {
                                      userInput = '';
                                      answer = '0';
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.blue[50],
                                  textColor: Colors.black,
                                );
                              }

                              // +/- button
                              else if (index == 1) {
                                return CalculatorButton(
                                  buttonText: buttons[index],
                                  color: Colors.blue[50],
                                  textColor: Colors.black,
                                );
                              }
                              // % Button
                              else if (index == 2) {
                                return CalculatorButton(
                                  buttontapped: () {
                                    setState(() {
                                      userInput += buttons[index];
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.blue[50],
                                  textColor: Colors.black,
                                );
                              }
                              // Delete Button
                              else if (index == 3) {
                                return CalculatorButton(
                                  buttontapped: () {
                                    setState(() {
                                      userInput =
                                          userInput.substring(
                                              0, userInput.length - 1);
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.blue[50],
                                  textColor: Colors.black,
                                );
                              }
                              // Equal_to Button
                              else if (index == 18) {
                                return CalculatorButton(
                                  buttontapped: () {
                                    setState(() {
                                      equalPressed();
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.orange[700],
                                  textColor: Colors.white,
                                );
                              }

                              //  other buttons
                              else {
                                return CalculatorButton(
                                  buttontapped: () {
                                    setState(() {
                                      userInput += buttons[index];
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: isOperator(buttons[index])
                                      ? Colors.white
                                      : const Color(0xFFA5672B),
                                  textColor: isOperator(buttons[index])
                                      ? const Color(0xFFA5672B)
                                      : Colors.black,
                                );
                              }
                            }
                            ),
                      ),
                    ],
                  ),
                );
              }
            }
            ),
    );
  }
}

