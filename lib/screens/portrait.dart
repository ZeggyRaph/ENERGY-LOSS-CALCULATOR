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
  final meterModel = MeterCalculationModel();

  @override
  void initState() {
    meterModel.initState();
    super.initState();
  }

  @override
  void dispose() {
    meterModel.dispose();
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
                            kontroller: meterModel.voltageController,
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
                            kontroller: meterModel.currentController,
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
                            kontroller: meterModel.availabilityController,
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
                            kontroller: meterModel.tariffController,
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
                            kontroller: meterModel.meterTypeController,
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
                            kontroller: meterModel.noOfMonthsController,
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
                                onPressedbtn: () {
                                  setState(() {
                                    //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED,
                                    // THE SOFT KEYBOARD DISAPPEARS
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    meterModel.calculate();
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
                                  meterModel.reset();
                                });
                              },
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: ResultCard(
                              resultLabel: 'POW:', resultAnswer: meterModel.powerResult),
                        ),
                        Expanded(
                          child: ResultCard(
                            resultLabel: 'ENE:',
                            resultAnswer: meterModel.energyResult,
                          ),
                        ),
                        Expanded(
                          child: ResultCard(
                            resultLabel: 'LOR:',
                            resultAnswer: meterModel.lorResult,
                          ),
                        ),
                        Expanded(
                          child: ResultCard(
                            resultLabel: 'ADM:',
                            resultAnswer: meterModel.admResult,
                          ),
                        ),
                        Expanded(
                          child: ResultCard(
                            resultLabel: 'TOT:',
                            resultAnswer: meterModel.totalResult,
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
