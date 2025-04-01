
import 'package:flutter/material.dart';

import '../landscape.dart';
import '../model/appliance.dart';
import '../model/calc_model.dart';

class LoadCalculatorScreen extends StatefulWidget {
  static const String id = 'load_calculator_screen';
  const LoadCalculatorScreen({Key? key}) : super(key: key);

  @override
  _LoadCalculatorScreenState createState() => _LoadCalculatorScreenState();
}

class _LoadCalculatorScreenState extends State<LoadCalculatorScreen> {
  final meterModel = MeterCalculationModel();


  List<Appliance> appliances = [
    Appliance(name: "Air conditioner 1hp", quantity: 1, wattage: 1350),
    Appliance(name: "Air conditioner 1.5hp", quantity: 1, wattage: 1500),
    Appliance(name: "Air conditioner 2hp", quantity: 1, wattage: 1865),
    Appliance(name: "AM/FM auto cassette player", quantity: 1, wattage: 8),
    Appliance(name: "Battery car charge", quantity: 1, wattage: 150),
    Appliance(name: "blender", quantity: 1, wattage: 300),
    Appliance(name: "Boiling Ring", quantity: 1, wattage: 1500),
    Appliance(name: "Boiling Ring", quantity: 1, wattage: 2500),
    Appliance(name: "Ceiling fan", quantity: 1, wattage: 80),
    Appliance(name: "Clock", quantity: 1, wattage: 3),
    Appliance(name: "Clothes Dryer", quantity: 1, wattage: 4000),
    Appliance(name: "Coffee maker", quantity: 1, wattage: 1165),
    Appliance(name: "Coffee maker", quantity: 1, wattage: 1165),
    Appliance(name: "Computer monitor and printer", quantity: 1, wattage: 365),
    Appliance(name: "Convection oven", quantity: 1, wattage: 1500),
    Appliance(name: "Dishwasher Appliances(Dry cycle) ", quantity: 1, wattage: 1200),
    Appliance(name: "Dishwasher Appliances(Dry cycle) ", quantity: 1, wattage: 1500),
    Appliance(name: "Standing Fan", quantity: 1, wattage: 80),
    Appliance(name: "Electric heat Appliances(Base boar furnace)", quantity: 1, wattage: 300),
    Appliance(name: "Electric heat Appliances(Base boar furnace)", quantity: 1, wattage: 400),
    Appliance(name: "Electric heat Appliances(Base boar furnace)", quantity: 1, wattage: 1000),
    Appliance(name: "Electric kettle", quantity: 1, wattage: 1000),
    Appliance(name: "Electric kettle", quantity: 1, wattage: 1500),
    Appliance(name: "Electric cooker with oven", quantity: 1, wattage: 1000),
    Appliance(name: "Electric mower", quantity: 1, wattage: 1500),
    Appliance(name: "Frying plate", quantity: 1, wattage: 1200),
    Appliance(name: "Frying plate", quantity: 1, wattage: 1500),
    Appliance(name: "Freezer", quantity: 1, wattage: 500),
    Appliance(name: "Hot plate/Boiling Ring", quantity: 1, wattage: 1200),
    Appliance(name: "Hot plate/Boiling Ring", quantity: 1, wattage: 1500),
    Appliance(name: "Iron", quantity: 1, wattage: 1000),
    Appliance(name: "Iron", quantity: 1, wattage: 1500),
    Appliance(name: "Iron", quantity: 1, wattage: 2500),
    Appliance(name: "Jacuzzi(Maintain Temperature, 2persons", quantity: 1, wattage: 1500),
    Appliance(name: "Light:100watt incandescent", quantity: 1, wattage: 100),
    Appliance(name: "Light:25watt compact Fluorescent", quantity: 1, wattage: 28),
    Appliance(name: "Light:50watt DC incandescent", quantity: 1, wattage: 50),
    Appliance(name: "Light:40watt DC Halogen", quantity: 1, wattage: 40),
    Appliance(name: "Light:20watt compact Fluorescent", quantity: 1, wattage: 20),
    Appliance(name: "Laptop", quantity: 1, wattage: 65),
    Appliance(name: "Laptop", quantity: 1, wattage: 75),
    Appliance(name: "Microwave", quantity: 1, wattage: 1450),
    Appliance(name: "Phone charger", quantity: 1, wattage: 2),
    Appliance(name: "Phone charger", quantity: 1, wattage: 4),
    Appliance(name: "Phone charger", quantity: 1, wattage: 5),
    Appliance(name: "Phone charger", quantity: 1, wattage: 6),
    Appliance(name: "Popcorn popper", quantity: 1, wattage: 250),
    Appliance(name: "Pool filter motor", quantity: 1, wattage: 1500),
    Appliance(name: "Radio", quantity: 1, wattage: 110),
    Appliance(name: "Refrigerator", quantity: 1, wattage: 800),
    Appliance(name: "Television-25\" colour", quantity: 1, wattage: 150),
    Appliance(name: "Television-19\" colour", quantity: 1, wattage: 120),
    Appliance(name: "Toaster", quantity: 1, wattage: 800),
    Appliance(name: "Toaster", quantity: 1, wattage: 1200),
    Appliance(name: "Toaster", quantity: 1, wattage: 1500),
    Appliance(name: "Sewing", quantity: 1, wattage: 1000),
    Appliance(name: "Sewing machine", quantity: 1, wattage: 1000),
    Appliance(name: "Sink Waste Disposal", quantity: 1, wattage: 750),
    Appliance(name: "VCD Player", quantity: 1, wattage: 25),
    Appliance(name: "Vacuum cleaner - High Power", quantity: 1, wattage: 2000),
    Appliance(name: "Vacuum cleaner - Upright", quantity: 1, wattage: 500),
    Appliance(name: "Vacuum cleaner - Upright", quantity: 1, wattage: 700),
    Appliance(name: "Vacuum cleaner - Handheld", quantity: 1, wattage: 600),
    Appliance(name: "Washing Machine (Front Load/Top Load, with Spin Dry) ", quantity: 1, wattage: 1500),
    Appliance(name: "Water Heater (Electric Storage Heater - 15L to 50L) ", quantity: 1, wattage: 2000),
    Appliance(name: "Pumping Machine (0.5 HP - 1 HP)", quantity: 1, wattage: 1100),


  ];

  var energyCost = 0.0;

  double totalWattage = 0;
  void calculateTotalWattage() {

    totalWattage = appliances
        .where((appliance) => appliance.selected)
        .fold(0, (sum, appliance) => sum + (appliance.wattage! * appliance.quantity!));
  }

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



  void addAppliance() {
    showDialog(
      context: context,
      builder: (context) {
        String name = "";
        int quantity = 1;
        double wattage = 100;
        return AlertDialog(
          title: const Text("Add New Appliance"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Appliance Name"),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number,
                onChanged: (value) => quantity = int.tryParse(value) ?? 1,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Wattage"),
                keyboardType: TextInputType.number,
                onChanged: (value) => wattage = double.tryParse(value) ?? 100,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  setState(() {
                    appliances.add(Appliance(name: name, quantity: quantity, wattage: wattage));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }


  void editApplianceQuantity(int index) {
    int newQuantity = appliances[index].quantity!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit ${appliances[index].name} Quantity"),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Enter new quantity"),
            onChanged: (value) {
              newQuantity = int.tryParse(value) ?? appliances[index].quantity!;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  appliances[index].quantity = newQuantity;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }


  bool showInputs = false; // Controls visibility

  @override
  Widget build(BuildContext context) {
    calculateTotalWattage(); // Update total wattage dynamically
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Load Assessment",
        style: TextStyle(
        fontSize: 20.0,
        color: Color(0xFFA5672B),
    ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addAppliance,
          ),
        ],
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
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: appliances.length,
                      itemBuilder: (context, index) {
                        final appliance = appliances[index];
                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: appliance.selected,
                              onChanged: (value) {
                                setState(() {
                                  appliance.selected = value!;
                                });
                              },
                            ),
                            title: Text(appliance.name!),
                            subtitle: Text("Wattage: ${appliance.wattage} W | Quantity: ${appliance.quantity}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                editApplianceQuantity(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showInputs = !showInputs;
                      });
                    },
                    child: Text(showInputs ? "Hide Inputs" : "Show Inputs"),
                  ),

                  Visibility(
                    visible: showInputs,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 200, // Adjust height to fit within available space
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            TextField(
                              decoration: const InputDecoration(labelText: "Power Availability (Hrs/Month)"),
                              keyboardType: TextInputType.number,
                              controller: meterModel.availabilityController,
                            ),
                            TextField(
                              decoration: const InputDecoration(labelText: "Tariff (per kWh)"),
                              keyboardType: TextInputType.number,
                              controller: meterModel.tariffController,
                            ),
                            TextField(
                              decoration: const InputDecoration(labelText: "Diversity Factor"),
                              keyboardType: TextInputType.number,
                              controller: meterModel.diversityController,
                            ),
                            TextField(
                              decoration: const InputDecoration(labelText: "Duration (Month)"),
                              keyboardType: TextInputType.number,
                              controller: meterModel.noOfMonthsController,
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                if (meterModel.availabilityController.text.isEmpty ||
                                    meterModel.tariffController.text.isEmpty ||
                                    meterModel.diversityController.text.isEmpty ||
                                    meterModel.noOfMonthsController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("All fields must be filled!")),
                                  );
                                  return;
                                }

                                try {
                                  var avail = double.parse(meterModel.availabilityController.text);
                                  var tariff = double.parse(meterModel.tariffController.text);
                                  var diversity = double.parse(meterModel.diversityController.text);
                                  var month = double.parse(meterModel.noOfMonthsController.text);

                                  if (avail <= 0 || tariff <= 0 || diversity <= 0 || month <= 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Values must be greater than zero!")),
                                    );
                                    return;
                                  }

                                  setState(() {
                                    energyCost = (totalWattage / 1000) *
                                        avail *
                                        tariff *
                                        diversity *
                                        month *
                                        1.075;
                                  });
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Please enter valid numbers!")),
                                  );
                                }
                              },
                              child: const Text("Calculate"),
                            ),

                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              color: Colors.blue.shade700,
                              child: Text(
                                "Total Wattage: ${totalWattage.toStringAsFixed(2)} W",
                                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              color: Colors.blue.shade700,
                              child: Text(
                                "Energy Cost: #${energyCost.toStringAsFixed(2)}",
                                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
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



