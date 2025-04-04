import 'package:energy_loss_calculator/component/calculate_reset_btn.dart';
import 'package:energy_loss_calculator/component/result_card.dart';
import 'package:energy_loss_calculator/landscape.dart';
import 'package:energy_loss_calculator/model/calc_model.dart';
import 'package:energy_loss_calculator/palette.dart';
import 'package:energy_loss_calculator/reusable_textfield.dart';
import 'package:flutter/material.dart';

class NegativeKwh extends StatefulWidget {
  static const String id = 'negative_kwh';

  const NegativeKwh({Key? key}) : super(key: key);

  @override
  State<NegativeKwh> createState() => _NegativeKwhState();
}

class _NegativeKwhState extends State<NegativeKwh> {
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
        title: const Text(
          'NEGATIVE KWH',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFFA5672B),
          ),
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
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
                        Text(
                          'NEGATIVE VALUE(KWH)',
                          style: textStyle,
                        ),
                        ReusableTextField(
                                                    kontroller: energyCalculationModel.negativeKwhController,
                                                    labText: 'negative_kwh',
                                                    hintTex: 'Enter the kwh value without minus sign',
                                                  ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
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
                        Text(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              //ELEVATEDBUTTON FOR  ADDITION
                              child: CalcResetBttn(
                                btnText: 'CALCULATE',
                                onPressedbtn: () {
                                  setState(() {
                                    energyCalculationModel.calculateNegativeKwh(
                                    );
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
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
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
