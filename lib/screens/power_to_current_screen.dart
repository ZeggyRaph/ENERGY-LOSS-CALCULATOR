import 'package:energy_loss_calculator/component/calculate_reset_btn.dart';
import 'package:energy_loss_calculator/component/result_card.dart';
import 'package:energy_loss_calculator/landscape.dart';

import 'package:energy_loss_calculator/palette.dart';
import 'package:energy_loss_calculator/reusable_textfield.dart';
import 'package:flutter/material.dart';

import '../model/calc_model.dart';


class PowerToCurrentScreen extends StatefulWidget {
  static const String id = 'power_to_current_screen';


  const PowerToCurrentScreen({Key? key}) : super(key: key);

  @override
  State<PowerToCurrentScreen> createState() => _PowerToCurrentScreenState();
}

class _PowerToCurrentScreenState extends State<PowerToCurrentScreen> {
  final energyCalculationModel = MeterCalculationModel();



  @override
  void dispose() {
    energyCalculationModel.dispose();
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
                      ReusableTextField(
                        kontroller:  energyCalculationModel.powerController,
                        labText: 'power',
                        hintTex: 'Enter the power value in Watts',
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      ReusableTextField(
                        kontroller: energyCalculationModel.voltageController,
                        labText: 'Voltage',
                        hintTex: 'Enter 240 for voltage value',
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
                                  energyCalculationModel.convertPowerToCurrent();
                                });
                              },),
                          ),
                          const SizedBox(
                            width: 10.0,
                            height: 10.0,
                          ),

                          
                          Expanded(
                            child: CalcResetBttn(
                              btnText: 'RESET',
                              onPressedbtn:  () {
                                setState(() {
                                  energyCalculationModel.reset();
                                });
                              },),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ResultCard(
                          resultLabel:'POWER(KW):',
                          resultAnswer: energyCalculationModel.powerKwResult),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ResultCard(
                          resultLabel:'CURRENT(A):',
                          resultAnswer: energyCalculationModel.currentResult),

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




