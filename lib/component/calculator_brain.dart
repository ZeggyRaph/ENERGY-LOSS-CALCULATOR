// import 'package:flutter/material.dart';
//
// class CalculatorBrain {
//
//
//   //DECLARING VARIABLES
//   //TextEditingController currentController = TextEditingController();
//  late  TextEditingController? negativeKwhController = TextEditingController();
//   //TextEditingController availabilityController = TextEditingController();
//  late TextEditingController? tariffController = TextEditingController();
//   //TextEditingController noOfMonthsController = TextEditingController();
//  late TextEditingController? meterType = TextEditingController();
//   String lorResult;
//   String energyResult;
//   String powerResult;
//   String admResult;
//   String totalResult;
//   double vat;
//  double pf;
//   int kilo;
//  double df;
//
//   //  String lorResult = '0';
//   // String energyResult = '0';
//   // String powerResult = '0';
//   // String admResult = '0';
//   // String totalResult = '0';
//   // final vat = 1.075;
//   // final pf = 0.85;
//   // final kilo = 1000;
//   // final df = 0.6;
//
//   CalculatorBrain({this.negativeKwhController,
//     this.meterType,
//     this.tariffController,
//     this.totalResult ='0',
//   this.admResult ='0',
//   this.lorResult ='0',
//   this.energyResult ='0',
//   this.powerResult ='0',
//   this.df =0.6,
//   this.kilo = 1000,
//   this.pf = 0.85,
//   this.vat = 1.075});
//
//
//    //This is the function that does the calculation when called.
//   calculate() {
//     const singlephaseAdm = 1500;
//     const threePhaseAdm = 3000;
//     int? admInput;
//
//     if (double.parse(meterType!.text) == 1 && meterType != null) {
//       admInput = singlephaseAdm;
//     } else {
//       admInput = threePhaseAdm;
//     }
//     //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED, THE SOFT KEYBOARD DISAPPEAR
//     FocusManager.instance.primaryFocus?.unfocus();
//     //THIS CALCULATE THE POWER
//     //double power = double.parse(voltageController.text) * double.parse(currentController.text) * pf / kilo;
//
//     //TO CALCULATE THE ENERGY
//     // double energy = power *
//     //     double.parse(availabilityController.text) *
//     //     double.parse(noOfMonthsController.text) *
//     //     df;
//
//     // THIS CALCULATE THE LOSS OF REVENUE
//     if (negativeKwhController != null && tariffController != null) {
//       double lor =
//           double.parse(negativeKwhController!.text) *
//               double.parse(tariffController!.text) * vat;
//       //powerResult = power.toStringAsFixed(2);
//       //energyResult = energy.toStringAsFixed(2);
//       lorResult = lor.toStringAsFixed(2);
//
//       //TO CALCULATE ADM CHARGE
//       admResult = admInput.toString();
//
//
//       //TO CALCULATE THE TOTAL
//       double total =
//           lor + admInput.toDouble();
//
//
//       totalResult = total.toStringAsFixed(2);
//     }
//   }
//   //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULTS TO ZERO
//   reset(){
//     // //voltageController.text = '';
//     // //currentController.text = '';
//     // negativeKwhController!.text = '';
//     // //availabilityController.text = '';
//     // tariffController!.text = '';
//     // //noOfMonthsController.text = '';
//     // meterType!.text = '';
//     // powerResult = '0';
//     // energyResult = '0';
//     // lorResult = '0';
//     // admResult = '0';
//     // totalResult = '0';
//   }
//
//
// }
//
