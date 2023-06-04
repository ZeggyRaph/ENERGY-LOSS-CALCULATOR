import 'package:flutter/material.dart';


import 'package:loss_of_revenue_calculator/reusable_textfield.dart';
import 'package:loss_of_revenue_calculator/palette.dart';
import 'package:loss_of_revenue_calculator/landscape.dart';
import 'package:loss_of_revenue_calculator/component/calculate_reset_btn.dart';
import 'package:loss_of_revenue_calculator/component/result_card.dart';

class Energy extends StatefulWidget {
  static const String id = 'amp_to_kw_to_kwh_screen';
  const Energy({Key? key}) : super(key: key);

  @override
  State<Energy> createState() => _EnergyState();
}

class _EnergyState extends State<Energy> {
  //DECLARING VARIABLES
  TextEditingController currentController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController noOfMonthsController = TextEditingController();
  String lorResult = '0';
  String energyResult = '0';
  String powerResult = '0';
  String powerKwResult = '0';
  String admResult = '0';
  String totalResult = '0';
  final pf = 0.85;
  final kilo = 1000;
  final df = 0.6;


  //This is the function that does the calculation when called.
  calculate(){

    //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED, THE SOFT KEYBOARD DISAPPEAR
    FocusManager.instance.primaryFocus?.unfocus();
    //THIS CALCULATE THE POWER
    double power = double.parse(voltageController.text) * double.parse(currentController.text) * pf;
    double powerKw = double.parse(voltageController.text) * double.parse(currentController.text) * pf / kilo;
    //TO CALCULATE THE ENERGY
    double energy = powerKw *
        double.parse(availabilityController.text) *
        double.parse(noOfMonthsController.text) *
        df;


    energyResult=energy.toStringAsFixed(2);
    powerResult = power.toStringAsFixed(2);
    powerKwResult = powerKw.toStringAsFixed(2);
  }
  //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULTS TO ZERO
  reset(){
    voltageController.text = '';
    currentController.text = '';
    availabilityController.text = '';
    noOfMonthsController.text = '';
    powerResult = '0';
    powerKwResult = '0';
    energyResult = '0';

  }



  @override
  void initState() {
    voltageController= TextEditingController();
    currentController = TextEditingController();
    availabilityController = TextEditingController();
    noOfMonthsController= TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    voltageController.dispose();
    currentController.dispose();
    availabilityController.dispose();
    noOfMonthsController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('AMP->W->KW->KWH',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFFA5672B),
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
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child:
                  //EVERYTHING IS ARRANGED IN A FLEX
                  Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'VOLTAGE(V)',
                                style: textStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              //TEXTFIED PROPS. & STYLING
                              ReusableTextField(
                                kontroller: voltageController,
                                labText: 'Voltage',
                                hintTex: 'Enter 240 for voltage value',
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'CURRENT(A)',
                                style: textStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              //ANOTHER TEXTFIELD
                              ReusableTextField(
                                kontroller: currentController,
                                labText: 'Current',
                                hintTex: 'Enter current value',
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'AVAILABILITY(Hrs)',
                                style: textStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              //ANOTHER TEXTFIELD
                              ReusableTextField(
                                kontroller: availabilityController,
                                hintTex: 'Enter availability',
                                labText: 'Availability',
                              ),
                            ),

                            const SizedBox(
                              height: 10.0,
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'DURATION',
                                style: textStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              //ANOTHER TEXTFIELD
                              ReusableTextField(
                                kontroller: noOfMonthsController,
                                labText: 'Duration',
                                hintTex: 'Enter no. of months',
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
                              child: ResultCard(
                                  resultLabel:'WATT:',
                                  resultAnswer: powerResult),
                            ),
                            Expanded(
                              child: ResultCard(
                                resultLabel: 'KW:',
                                resultAnswer: powerKwResult,),
                            ),

                            Expanded(
                              child:ResultCard(
                                resultLabel: 'KWH:',
                                resultAnswer: energyResult,),
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
