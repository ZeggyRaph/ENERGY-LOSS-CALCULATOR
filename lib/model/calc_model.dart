import 'package:flutter/material.dart';
import 'appliance.dart';

class MeterCalculationModel extends ChangeNotifier {
  bool isTheftCase = false; // Add this variable

  // TextEditingControllers for user input
  final TextEditingController currentController = TextEditingController();
  final TextEditingController voltageController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();
  final TextEditingController tariffController = TextEditingController();
  final TextEditingController noOfMonthsController = TextEditingController();
  final TextEditingController meterTypeController = TextEditingController();
  final TextEditingController negativeKwhController = TextEditingController();
  final TextEditingController diversityController = TextEditingController();
  final TextEditingController wattageController = TextEditingController();
  final TextEditingController powerController = TextEditingController();

  double totalWattage = 0;

  // Variables to store results
  String lorResult = '0';
  String energyResult = '0';
  String powerResult = '0';
  String recCostResult = '0';
  String totalResult = '0';
  String powerKwResult = '0';
  String currentResult = '0';

  // Constants used in calculations
  static const double vat = 1.075;
  static const double pf = 0.85;
  static const int kilo = 1000;
  static const double df = 0.6;
  static const int singlePhaseRecCost = 10000;
  static const int threePhaseRecCost = 10000;
  static const int singlePhaseAdm = 100000;
  static const int threePhaseAdm = 200000;

  // Get meter type-based values
  int get admInput => (double.tryParse(meterTypeController.text) == 1) ? singlePhaseAdm : threePhaseAdm;
  int get recCostInput => (double.tryParse(meterTypeController.text) == 1) ? singlePhaseRecCost : threePhaseRecCost;

  // Function to calculate power
  double _calculatePower() {
    return (double.tryParse(voltageController.text) ?? 0) *
        (double.tryParse(currentController.text) ?? 0) *
        pf / kilo;
  }

  // Function to calculate energy
  double _calculateEnergy(double power) {
    return power *
        (double.tryParse(availabilityController.text) ?? 0) *
        (double.tryParse(noOfMonthsController.text) ?? 0) *
        (double.tryParse(diversityController.text) ?? 1);
  }

  // Function to calculate Loss of Revenue (LoR)
  void calculateLor() {
    FocusManager.instance.primaryFocus?.unfocus();
    double power = _calculatePower();
    double energy = _calculateEnergy(power);
    double lor = energy * (double.tryParse(tariffController.text) ?? 0) * vat;

    powerResult = power.toStringAsFixed(2);
    energyResult = energy.toStringAsFixed(2);
    lorResult = lor.toStringAsFixed(2);
    recCostResult = recCostInput.toString();

    double total = lor + recCostInput.toDouble();
    totalResult = total.toStringAsFixed(2);
    notifyListeners();
  }

  // Function to calculate Loss of Revenue (LoR) for Negative kWh
  void calculateNegativeKwh() {
    FocusManager.instance.primaryFocus?.unfocus();
    double lor = (double.tryParse(negativeKwhController.text) ?? 0) * (double.tryParse(tariffController.text) ?? 0) * vat;

    lorResult = lor.toStringAsFixed(2);
    recCostResult = recCostInput.toString();
    double total = lor + recCostInput.toDouble();
    totalResult = total.toStringAsFixed(2);
    notifyListeners();
  }

  // General calculation function
  void calculate() {
    FocusManager.instance.primaryFocus?.unfocus();
    double power = _calculatePower();
    double energy = _calculateEnergy(power);
    double lor = energy * (double.tryParse(tariffController.text) ?? 0) * vat;
    double total = lor + admInput.toDouble() + recCostInput.toDouble();

    powerResult = power.toStringAsFixed(2);
    energyResult = energy.toStringAsFixed(2);
    lorResult = lor.toStringAsFixed(2);
    recCostResult = recCostInput.toString();
    totalResult = total.toStringAsFixed(2);
    notifyListeners();
  }

  // Function to calculate total wattage from selected appliances
  void calculateTotalWattage() {
    totalWattage = appliances
        .where((appliance) => appliance.selected)
        .fold(0, (sum, appliance) => sum + (appliance.wattage! * appliance.quantity!));
  }

  // Convert current to power
  void convertCurrentToPower() {
    FocusManager.instance.primaryFocus?.unfocus();
    double power = (double.tryParse(voltageController.text) ?? 0) *
        (double.tryParse(currentController.text) ?? 0) *
        pf;
    double powerKw = power / kilo;
    double energy = _calculateEnergy(powerKw);

    energyResult = energy.toStringAsFixed(2);
    powerResult = power.toStringAsFixed(2);
    powerKwResult = powerKw.toStringAsFixed(2);
  }

  // Convert power to current
  void convertPowerToCurrent() {
    double voltagePf = (double.tryParse(voltageController.text) ?? 0) * pf;
    double current = (double.tryParse(powerController.text) ?? 0) / voltagePf;
    double powerKilo = (double.tryParse(powerController.text) ?? 0) / kilo;

    powerKwResult = powerKilo.toStringAsFixed(2);
    currentResult = current.toStringAsFixed(2);
  }

  // Function to reset all fields and results
  void reset() {
    voltageController.clear();
    currentController.clear();
    availabilityController.clear();
    tariffController.clear();
    noOfMonthsController.clear();
    meterTypeController.clear();
    negativeKwhController.clear();
    powerController.clear();
    currentResult = '0';
    powerKwResult = '0';
    powerResult = '0';
    energyResult = '0';
    lorResult = '0';
    recCostResult = '0';
    totalResult = '0';
  }

  // Dispose controllers to prevent memory leaks
  @override
  void dispose() {
    super.dispose();
    voltageController.dispose();
    currentController.dispose();
    availabilityController.dispose();
    tariffController.dispose();
    noOfMonthsController.dispose();
    meterTypeController.dispose();
    negativeKwhController.dispose();
    diversityController.dispose();
    wattageController.dispose();
    powerController.dispose();
  }
}
