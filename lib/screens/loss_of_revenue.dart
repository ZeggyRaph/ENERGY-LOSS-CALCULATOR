import 'package:energy_loss_calculator/component/calculate_reset_btn.dart';
import 'package:energy_loss_calculator/component/result_card.dart';
import 'package:energy_loss_calculator/landscape.dart';
import 'package:energy_loss_calculator/model/calc_model.dart';
import 'package:energy_loss_calculator/palette.dart';
import 'package:energy_loss_calculator/reusable_textfield.dart';
import 'package:flutter/material.dart';

class LorCharge extends StatefulWidget {
  static const String id = 'loss_of_revenue';
  const LorCharge({Key? key}) : super(key: key);

  @override
  State<LorCharge> createState() => _LorChargeState();
}

class _LorChargeState extends State<LorCharge> {
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
    return
      Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'LOSS OF REVENUE',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFFA5672B),
          ),
        ),
      ),
      body:
      OrientationBuilder(builder: (context, orientation)
      {
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

                ],
              ),
            ),
          );
        }
      }),
    );
  }
}




