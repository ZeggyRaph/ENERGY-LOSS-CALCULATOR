import 'package:flutter/material.dart';


import 'package:loss_of_revenue_calculator/reusable_textfield.dart';
import 'package:loss_of_revenue_calculator/palette.dart';
import 'package:loss_of_revenue_calculator/landscape.dart';
import 'package:loss_of_revenue_calculator/component/calculate_reset_btn.dart';
import 'package:loss_of_revenue_calculator/component/result_card.dart';

class NegativeKwh extends StatefulWidget {
  static const String id = 'negative_kwh';


 const  NegativeKwh({Key? key}) : super(key: key);




  @override
  State<NegativeKwh> createState() => _NegativeKwhState();
}

class _NegativeKwhState extends State<NegativeKwh> {
  //DECLARING VARIABLES
  TextEditingController negativeKwhController = TextEditingController();
  TextEditingController tariffController = TextEditingController();
  TextEditingController meterType = TextEditingController();
  String lorResult = '0';
  String admResult = '0';
  String totalResult = '0';
  final vat = 1.075;
  final pf = 0.85;
  final kilo = 1000;
  final df = 0.6;


  //This is the function that does the calculation when called.
  calculate(){
    const singlephaseAdm = 1500;
    const threePhaseAdm = 3000;
    int? admInput;
    if (double.parse(meterType.text) == 1) {
      admInput = singlephaseAdm;
    } else {
      admInput = threePhaseAdm;
    }
    //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED, THE SOFT KEYBOARD DISAPPEAR
    FocusManager.instance.primaryFocus?.unfocus();

    // THIS CALCULATE THE LOSS OF REVENUE
    double lor =
        double.parse(negativeKwhController.text) * double.parse(tariffController.text) * vat;
    lorResult = lor.toStringAsFixed(2);

    //TO CALCULATE ADM CHARGE
    admResult = admInput.toString();


    //TO CALCULATE THE TOTAL
    double total =
        lor + admInput.toDouble();


    totalResult = total.toStringAsFixed(2);
  }
  //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULTS TO ZERO
  reset(){
    negativeKwhController.text = '';
    tariffController.text = '';
    meterType.text = '';
    lorResult = '0';
    admResult = '0';
    totalResult = '0';
  }



  @override
  void initState() {
    negativeKwhController = TextEditingController();
    tariffController = TextEditingController();
    meterType = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    negativeKwhController = TextEditingController();
    tariffController.dispose();
    meterType.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        title: const Text('NEGATIVE KWH',
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
                                'NEGATIVE VALUE(KWH)',
                                style: textStyle,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              //TEXTFIED PROPS. & STYLING
                              ReusableTextField(

                                kontroller:  negativeKwhController,
                                labText: 'negative_kwh',
                                hintTex: 'Enter the kwh value without minus sign',
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
                              child:ResultCard(
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
                              child: ResultCard(
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
          }
      ),
    );
  }
}
