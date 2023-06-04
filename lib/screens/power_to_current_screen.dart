import 'package:flutter/material.dart';

import 'package:loss_of_revenue_calculator/reusable_textfield.dart';
import 'package:loss_of_revenue_calculator/palette.dart';
import 'package:loss_of_revenue_calculator/landscape.dart';
import 'package:loss_of_revenue_calculator/component/calculate_reset_btn.dart';
import 'package:loss_of_revenue_calculator/component/result_card.dart';


class PowerToCurrentScreen extends StatefulWidget {
  static const String id = 'power_to_current_screen';


  const PowerToCurrentScreen({Key? key}) : super(key: key);

  @override
  State<PowerToCurrentScreen> createState() => _PowerToCurrentScreenState();
}

class _PowerToCurrentScreenState extends State<PowerToCurrentScreen> {

  //DECLARING VARIABLES
  TextEditingController currentController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController tariffController = TextEditingController();
  TextEditingController noOfMonthsController = TextEditingController();
  TextEditingController meterTypeController = TextEditingController();
  TextEditingController powerController = TextEditingController();
  String lorResult = '0';
  String energyResult = '0';
  String powerResult = '0';
  String admResult = '0';
  String totalResult = '0';
  String powerKiloResult = '0';
  String currentResult ='0';
  final vat = 1.075;
  final pf = 0.85;
  final kilo = 1000;
  final df = 0.6;

  //This is the function that does the calculation when called.
  calculate(){
    //THIS CALCULATE THE POWER
    double voltagePf = double.parse(
          voltageController.text) * pf;

    double current = double.parse(powerController.text) /
          voltagePf;
    double powerKilo = double.parse(
          powerController.text) / kilo;

    // THIS CALCULATE THE LOSS OF REVENUE
    powerKiloResult = powerKilo.toStringAsFixed(2);
    currentResult = current.toStringAsFixed(2);
  }


  //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULTS TO ZERO
  reset(){
      voltageController.text = '';
      currentController.text = '';
      availabilityController.text = '';
      tariffController.text = '';
      noOfMonthsController.text = '';
      meterTypeController.text = '';
      powerController.text = '';
      powerResult = '0';
      energyResult = '0';
      lorResult = '0';
      admResult = '0';
      totalResult = '0';
      currentResult = '0';
      powerKiloResult = '0';
  }

  @override
  void initState() {
    voltageController= TextEditingController();
    powerController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    voltageController.dispose();
    powerController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
      AppBar(

      title: const Center(child: Text('WATTS TO AMPS ',
    style: TextStyle(
    fontSize: 20.0,
    color: Color(0xFFA5672B),),),),),

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
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child:
            //EVERYTHING IS ARRANGED IN A COLUMN
            Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          'POWER(Watts)',
                          style: textStyle,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:
                        //TEXTFIED PROPS. & STYLING
                        ReusableTextField(
                          kontroller:  powerController,
                          labText: 'power',
                          hintTex: 'Enter the power value in Watts',
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          'VOLTAGE(Volts)',
                          style: textStyle,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child:
                        //ANOTHER TEXTFIELD
                        ReusableTextField(
                          kontroller: voltageController,
                          labText: 'Voltage',
                          hintTex: 'Enter 240 for voltage value',
                        ),
                      ),

                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(

                            //ELEVATEDBUTTON FOR  ADDITION
                            child: CalcResetBttn(
                              btnText: 'CALCULATE',
                              onPressedbtn: (){
                                setState(() {
                                  //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED,
                                  // THE SOFT KEYBOARD DISAPPEARS
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  calculate();
                                });
                              },),
                          ),
                          const SizedBox(
                            width: 10.0,
                            height: 10.0,
                          ),

                          Expanded(
                            child:

                            //TO CLEAR THE  INPUT FIELDS AND RESULTS
                            CalcResetBttn(
                              btnText: 'RESET',
                              onPressedbtn:  () {
                                setState(() {
                                  reset();
                                });
                              },),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child:  ResultCard(
                            resultLabel:'POWER(KW):',
                            resultAnswer: powerKiloResult),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child:  ResultCard(
                            resultLabel:'CURRENT(A):',
                            resultAnswer: currentResult),
                      ),

                    ],
                  ),
                ),
              ],
            ),

          ),
        );
      }
        }
    ),
    );
  }
}




