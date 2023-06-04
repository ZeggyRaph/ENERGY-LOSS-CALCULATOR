import 'package:flutter/material.dart';

import 'package:loss_of_revenue_calculator/reusable_textfield.dart';
import 'package:loss_of_revenue_calculator/palette.dart';
import 'package:loss_of_revenue_calculator/landscape.dart';
import 'package:loss_of_revenue_calculator/component/calculate_reset_btn.dart';
import 'package:loss_of_revenue_calculator/component/result_card.dart';

class PortraitView extends StatefulWidget {
  static const String id = 'portrait';

 const PortraitView({Key? key}) : super(key: key);

  @override
  State<PortraitView> createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {

//Declares textfield controllers
  TextEditingController currentController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController tariffController = TextEditingController();
  TextEditingController noOfMonthsController = TextEditingController();
  TextEditingController meterType = TextEditingController();

  //Declares and initializes variables for the calculation
  String lorResult = '0';
  String energyResult = '0';
  String powerResult = '0';
  String admResult = '0';
  String totalResult = '0';
  final vat = 1.075;
  final pf = 0.85;
  final kilo = 1000;
  final df = 0.6;


  //This is the function that does the calculation when called.
   calculate(){
    const singlephasePen = 50000;
    const threePhasePen = 100000;
    const singlephaseAdm = 1500;
    const threePhaseAdm = 3000;
    int admInput;
    int penInput;
    if (double.parse(meterType.text) == 1) {
      admInput = singlephaseAdm;
    } else {
      admInput = threePhaseAdm;
    }
    if (double.parse(meterType.text) == 1) {
      penInput = singlephasePen;
    } else {
      penInput = threePhasePen;
    }


     //THIS CALCULATE THE POWER
    double power = double.parse(
        voltageController.text) *
        double.parse(currentController.text) *
        pf /
        kilo;


    //TO CALCULATE THE ENERGY
    double energy = power *
        double.parse(availabilityController.text) *
        double.parse(noOfMonthsController.text) *
        df;


    // THIS CALCULATE THE LOSS OF REVENUE
    double lor =
        energy *
            double.parse(tariffController.text) *
            vat;
    powerResult = power.toStringAsFixed(2);
    energyResult = energy.toStringAsFixed(2);
    lorResult = lor.toStringAsFixed(2);


    //TO CALCULATE ADM CHARGE
    admResult = admInput.toString();


    //TO CALCULATE THE TOTAL
    double total =
        lor + admInput.toDouble() +
            penInput.toDouble();
    totalResult = total.toStringAsFixed(2);
   }

  //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULTS TO ZERO
  reset(){
    voltageController.text = '';
    currentController.text = '';
    availabilityController.text = '';
    tariffController.text = '';
    noOfMonthsController.text = '';
    meterType.text = '';
    powerResult = '0';
    energyResult = '0';
    lorResult = '0';
    admResult = '0';
    totalResult = '0';
   }


  @override
  void initState() {
    voltageController= TextEditingController();
    currentController = TextEditingController();
    availabilityController = TextEditingController();
    tariffController = TextEditingController();
    meterType = TextEditingController();
    noOfMonthsController= TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    voltageController.dispose();
    currentController.dispose();
    availabilityController.dispose();
    tariffController.dispose();
    meterType.dispose();
    noOfMonthsController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
     return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        title: const Center(child: Text('ENERGY THEFT CHARGE',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFFA5672B),
          ),
        ),
        ),
      ),
      body:

      //THIS CHECKS THE ORIENTATION AND RENDERS ACCORDINGLY
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
                  child: Flex(
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
                              //TEXT-FIELD PROPS. & STYLING
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
                                'TARIFF(#)',
                                style: textStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              //ANOTHER TEXTFIELD
                              ReusableTextField(
                                kontroller: tariffController,
                                labText: 'Tariff',
                                hintTex: 'Enter tariff',
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'METER-TYPE',
                                style: textStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              //ANOTHER TEXTFIELD
                              ReusableTextField(
                                kontroller: meterType,
                                labText: 'No. of phases',
                                hintTex: 'Enter 1 or 3',
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
                                  },)
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Expanded(
                              child: ResultCard(
                                  resultLabel:'POW:',
                                  resultAnswer: powerResult),
                            ),

                             Expanded(
                              child: ResultCard(
                                resultLabel: 'ENE:',
                                resultAnswer: energyResult,),
                            ),
                            Expanded(
                              child: ResultCard(
                                resultLabel: 'LOR:',
                              resultAnswer: lorResult,),
                            ),
                            Expanded(
                              child: ResultCard(
                                resultLabel: 'ADM:',
                                resultAnswer: admResult,
                              ),
                            ),
                            Expanded(
                              child:
                              ResultCard(
                                resultLabel: 'TOT:',
                                resultAnswer: totalResult,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
