import 'package:energy_loss_calculator/component/calculate_reset_btn.dart';
import 'package:energy_loss_calculator/component/result_card.dart';
import 'package:energy_loss_calculator/landscape.dart';
import 'package:energy_loss_calculator/model/calc_model.dart';
import 'package:energy_loss_calculator/palette.dart';
import 'package:energy_loss_calculator/reusable_textfield.dart';
import 'package:flutter/material.dart';


class PortraitView extends StatefulWidget {
  static const String id = 'portrait';

  const PortraitView({Key? key}) : super(key: key);

  @override
  State<PortraitView> createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {
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
      appBar: AppBar(
        title: const Center(
          child: Text(
            'ENERGY THEFT CHARGE',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFFA5672B),
            ),
          ),
        ),
      ),
      body:

          //THIS CHECKS THE ORIENTATION AND RENDERS ACCORDINGLY
          OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          return const LandscapeView();
        } else {
          return 
          SafeArea(
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
                        const Text(
                          'VOLTAGE(V)',
                          style: textStyle,
                        ),
                        ReusableTextField(
                                                    kontroller: energyCalculationModel.voltageController,
                                                    labText: 'Voltage',
                                                    hintTex: 'Enter 240 for voltage value',
                                                  ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'CURRENT(A)',
                          style: textStyle,
                        ),
                        ReusableTextField(
                                                    kontroller: energyCalculationModel.currentController,
                                                    labText: 'Current',
                                                    hintTex: 'Enter current value',
                                                  ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'AVAILABILITY(Hrs)',
                          style: textStyle,
                        ),
                        ReusableTextField(
                                                    kontroller: energyCalculationModel.availabilityController,
                                                    hintTex: 'Enter availability',
                                                    labText: 'Availability',
                                                  ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'TARIFF(#)',
                          style: textStyle,
                        ),
                        ReusableTextField(
                                                    kontroller: energyCalculationModel.tariffController,
                                                    labText: 'Tariff',
                                                    hintTex: 'Enter tariff',
                                                  ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Diversity Factor',
                          style: textStyle,
                        ),
                        ReusableTextField(
                          kontroller: energyCalculationModel.diversityController,
                          labText: 'DF',
                          hintTex: 'Enter a df value between 0.6 & 1',
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'METER-TYPE',
                          style: textStyle,
                        ),
                        ReusableTextField(
                                                    kontroller: energyCalculationModel.meterTypeController,
                                                    labText: 'No. of phases',
                                                    hintTex: 'Enter 1 or 3',
                                                  ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'DURATION',
                          style: textStyle,
                        ),
                        ReusableTextField(
                                                    kontroller: energyCalculationModel.noOfMonthsController,
                                                    labText: 'Duration',
                                                    hintTex: 'Enter no. of months',
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
                                onPressedbtn: () {
                                  setState(() {
                                    //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED,
                                    // THE SOFT KEYBOARD DISAPPEARS
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    energyCalculationModel.calculate();
                                  });
                                },
                              ),
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
                              onPressedbtn: () {
                                setState(() {
                                  energyCalculationModel.reset();
                                });
                              },
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ResultCard(
                            resultLabel: 'POW:', resultAnswer: energyCalculationModel.powerResult),
                        ResultCard(
                          resultLabel: 'ENE:',
                          resultAnswer: energyCalculationModel.energyResult,
                        ),
                        ResultCard(
                          resultLabel: 'LOR:',
                          resultAnswer: energyCalculationModel.lorResult,
                        ),
                        ResultCard(
                          resultLabel: 'Rec cost:',
                          resultAnswer: energyCalculationModel.recCostResult,
                        ),
                        ResultCard(
                          resultLabel: 'TOT:',
                          resultAnswer: energyCalculationModel.totalResult,
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
