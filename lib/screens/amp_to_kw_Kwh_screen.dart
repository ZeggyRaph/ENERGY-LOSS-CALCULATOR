import 'package:flutter/material.dart';
import 'package:energy_loss_calculator/component/calculate_reset_btn.dart';
import 'package:energy_loss_calculator/component/result_card.dart';
import 'package:energy_loss_calculator/landscape.dart';
import 'package:energy_loss_calculator/palette.dart';
import 'package:energy_loss_calculator/reusable_textfield.dart';
import '../model/calc_model.dart';

class Energy extends StatefulWidget {
  static const String id = 'amp_to_kw_to_kwh_screen';
  const Energy({Key? key}) : super(key: key);

  @override
  State<Energy> createState() => _EnergyState();
}

class _EnergyState extends State<Energy> {
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
          'AMP → WATT',
          style: TextStyle(fontSize: 20.0, color: Color(0xFFA5672B)),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? const LandscapeView()
              : SafeArea(
            maintainBottomViewPadding: true,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                       // _buildLabel('VOLTAGE (V)'),
                        _buildTextField(
                          controller: energyCalculationModel.voltageController,
                          label: 'Voltage',
                          hint: 'Enter 240 for voltage value',
                        ),

                        SizedBox(height: 20,),
                        _buildTextField(
                          controller: energyCalculationModel.currentController,
                          label: 'Current',
                          hint: 'Enter current value',
                        ),

                        const SizedBox(height: 10.0),
                        _buildButtonRow(),
                        const SizedBox(height: 10.0),
                        ResultCard(
                          resultLabel: 'WATT:',
                          resultAnswer: energyCalculationModel.powerResult,
                        ),
                        ResultCard(
                          resultLabel: 'KW:',
                          resultAnswer: energyCalculationModel.powerKwResult,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget to create labels for text fields
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(text, style: textStyle),
    );
  }

  // Widget to create text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return ReusableTextField(
      kontroller: controller,
      labText: label,
      hintTex: hint,
    );
  }

  // Widget to create the button row
  Widget _buildButtonRow() {
    return Row(
      children: [
        Expanded(
          child: CalcResetBttn(
            btnText: 'CALCULATE',
            onPressedbtn: () {
              setState(() {
                energyCalculationModel.convertCurrentToPower();
              });
            },
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: CalcResetBttn(
            btnText: 'RESET',
            onPressedbtn: () {
              setState(() {
                energyCalculationModel.reset();
              });
            },
          ),
        ),
      ],
    );
  }
}
