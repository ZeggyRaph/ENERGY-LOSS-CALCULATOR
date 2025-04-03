import 'package:flutter/material.dart';

import 'appliance.dart';

class MeterCalculationModel {
  // TextEditingControllers for user input
  TextEditingController currentController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController tariffController = TextEditingController();
  TextEditingController noOfMonthsController = TextEditingController();
  TextEditingController meterTypeController = TextEditingController();
  TextEditingController negativeKwhController = TextEditingController();
  TextEditingController diversityController = TextEditingController();
  TextEditingController wattageController = TextEditingController();

  double totalWattage = 0;

  // Variables to store results
  String lorResult = '0';
  String energyResult = '0';
  String powerResult = '0';
  String admResult = '0';
  String totalResult = '0';

  // Constants used in calculations
  final double vat = 1.075;
  final double pf = 0.85;
  final int kilo = 1000;
  final double df = 0.6;

  // Function to perform calculations
  void calculate() {
    const int singlePhasePenalty = 50000;
    const int threePhasePenalty = 100000;
    const int singlePhaseAdm = 1500;
    const int threePhaseAdm = 3000;

    int admInput;
    int penInput;

    double meterType = double.tryParse(meterTypeController.text) ?? 0;

    admInput = (meterType == 1) ? singlePhaseAdm : threePhaseAdm;
    penInput = (meterType == 1) ? singlePhasePenalty : threePhasePenalty;

    // Calculate Power
    double power = (double.tryParse(voltageController.text) ?? 0) *
        (double.tryParse(currentController.text) ?? 0) *
        pf /
        kilo;

    // Calculate Energy
    double energy = power *
        (double.tryParse(availabilityController.text) ?? 0) *
        (double.tryParse(noOfMonthsController.text) ?? 0) *
        df;

    // Calculate Loss of Revenue (LoR)
    double lor = energy * (double.tryParse(tariffController.text) ?? 0) * vat;

    // Store calculated values as formatted strings
    powerResult = power.toStringAsFixed(2);
    energyResult = energy.toStringAsFixed(2);
    lorResult = lor.toStringAsFixed(2);
    admResult = admInput.toString();

    // Calculate Total
    double total = lor + admInput + penInput;
    totalResult = total.toStringAsFixed(2);
  }


   //This is the function that does the lor calculation when called.
  calculateLor(){
    const singlephaseAdm = 1500;
    const threePhaseAdm = 3000;
    int? admInput;
    if (double.parse(meterTypeController.text) == 1) {
      admInput = singlephaseAdm;
    } else {
      admInput = threePhaseAdm;
    }
    //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED, THE SOFT KEYBOARD DISAPPEAR
    FocusManager.instance.primaryFocus?.unfocus();
    //THIS CALCULATE THE POWER
    double power = double.parse(voltageController.text) * double.parse(currentController.text) * pf / kilo;

      //TO CALCULATE THE ENERGY
      double energy = power *
          double.parse(availabilityController.text) *
          double.parse(noOfMonthsController.text) *
          df;

      // THIS CALCULATE THE LOSS OF REVENUE
      double lor =
          energy * double.parse(tariffController.text) * vat;
      powerResult = power.toStringAsFixed(2);
      energyResult = energy.toStringAsFixed(2);
      lorResult = lor.toStringAsFixed(2);

      //TO CALCULATE ADM CHARGE
      admResult = admInput.toString();


      //TO CALCULATE THE TOTAL
      double total =
          lor + admInput.toDouble();


      totalResult = total.toStringAsFixed(2);
    }


  //This is the function that does the calculation when called.
  calculateNegativeKwh(){
    const singlephaseAdm = 1500;
    const threePhaseAdm = 3000;
    int? admInput;
    if (double.parse(meterTypeController.text) == 1) {
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

  void calculateTotalWattage() {

    totalWattage = appliances
        .where((appliance) => appliance.selected)
        .fold(0, (sum, appliance) => sum + (appliance.wattage! * appliance.quantity!));
  }

  // Function to reset all fields and results
  void reset() {
    voltageController.clear();
    currentController.clear();
    availabilityController.clear();
    tariffController.clear();
    noOfMonthsController.clear();
    meterTypeController.clear();
     negativeKwhController.text = '';

    powerResult = '0';
    energyResult = '0';
    lorResult = '0';
    admResult = '0';
    totalResult = '0';
  }

  void initState() {
    voltageController = TextEditingController();
    currentController = TextEditingController();
    availabilityController = TextEditingController();
    tariffController = TextEditingController();
    meterTypeController = TextEditingController();
    noOfMonthsController = TextEditingController();
    negativeKwhController = TextEditingController();
    diversityController = TextEditingController();
    wattageController = TextEditingController();

  }

  // Dispose controllers to prevent memory leaks
  void dispose() {
    voltageController.dispose();
    currentController.dispose();
    availabilityController.dispose();
    tariffController.dispose();
    noOfMonthsController.dispose();
    meterTypeController.dispose();
    negativeKwhController.dispose();
     diversityController.dispose();
    wattageController.dispose();

  }

  void energyCost(){



  }



}
