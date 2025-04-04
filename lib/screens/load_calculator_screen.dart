
import 'package:flutter/material.dart';

import '../landscape.dart';
import '../model/appliance.dart';
import '../model/calc_model.dart';
import '../palette.dart';
import '../reusable_textfield.dart';

class LoadCalculatorScreen extends StatefulWidget {
  static const String id = 'load_calculator_screen';
  const LoadCalculatorScreen({Key? key}) : super(key: key);

  @override
  _LoadCalculatorScreenState createState() => _LoadCalculatorScreenState();
}

class _LoadCalculatorScreenState extends State<LoadCalculatorScreen> {
  final energyCalculationModel = MeterCalculationModel();


  //List<Appliance> appliances = [];

  var energyCost = 0.0;






  @override
  void dispose() {
    energyCalculationModel.dispose();
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
          title: const Text("Add New Appliance",style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFFA5672B),
          ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Appliance Name",),
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
              child: const Text("Cancel",style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFA5672B),
              ),),
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
              child: const Text("Add",style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFA5672B),
              ),),
            ),
          ],
        );
      },
    );
  }


  void editApplianceQuantity( index) {
    int newQuantity = appliances[index].quantity!;
    double newWattage = appliances[index].wattage!;



    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit ${appliances[index].name} Wattage and Quantity",style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFFA5672B),
          ),),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Enter new wattage"),
                  onChanged: (value) {
                    newWattage = double.tryParse(value) ?? appliances[index].wattage!;
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Enter new quantity"),
                  onChanged: (value) {
                    newQuantity = int.tryParse(value) ?? appliances[index].quantity!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel",style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFA5672B),
              ),),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  appliances[index].quantity = newQuantity;
                  appliances[index].wattage = newWattage;
                });
                Navigator.pop(context);
              },
              child: const Text("Save",style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFA5672B),
              ),),
            ),
          ],
        );
      },
    );
  }


  bool showInputs = false; // Controls visibility

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    energyCalculationModel.calculateTotalWattage(); // Update total wattage dynamically
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Load Calculator",
        style: TextStyle(
        fontSize: 24.0,
        color: Color(0xFFA5672B),
    ),),
        actions: [

         InkWell(
           onTap: addAppliance,
           child: Padding(
             padding: const EdgeInsets.only(right: 15.0),
             child: Text('Add new', style: TextStyle(
             fontSize: 14.0,
             color: isDarkMode ? Colors.white : const Color(0xFFA5672B),
                          ),),
           ),
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
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(color: const Color(0xFFA5672B,),
                              child: ListTile(
                                leading: Checkbox(
                                  checkColor: isDarkMode ? Colors.brown : Colors.white, // Color of the check mark
                                  fillColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return isDarkMode ? Colors.white : Colors.brown; // Filled color when checked
                                      }
                                      return isDarkMode ? Colors.brown : Colors.white; // Filled color when unchecked
                                    },
                                  ),
                                  value: appliance.selected,
                                  onChanged: (value) {
                                    setState(() {
                                      appliance.selected = value!;
                                    });
                                  },
                                ),

                                title: Text(appliance.name!,style: TextStyle(color: isDarkMode ? Colors.white : Colors.white,fontSize: 18),),
                                subtitle: Text("Wattage: ${appliance.wattage} W  Quantity: ${appliance.quantity}"
                                  ,style: TextStyle(color: isDarkMode ? Colors.white : Colors.white,fontSize: 16),),
                                trailing: IconButton(
                                  icon:  Icon(Icons.edit,color: isDarkMode ? Colors.white : Colors.white,),
                                  onPressed: () {
                                    editApplianceQuantity(index);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 5,)
                          ],
                        );
                      },

                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.black,

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      ),
                      backgroundColor: const Color(0xFFA5672B),),
                    onPressed: () {
                      setState(() {
                        showInputs = !showInputs;
                      });
                    },
                    child: Text(showInputs ? "Hide Inputs" : "Show Inputs",
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ),

                  Visibility(
                    visible: showInputs,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 300, // Adjust height to fit within available space
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ReusableTextField(
                              kontroller: energyCalculationModel.availabilityController,
                              labText: 'Power Availability (Hrs/Month)',
                              hintTex: 'Enter total hours of power in a month',
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ReusableTextField(
                              kontroller: energyCalculationModel.tariffController,
                              labText: 'Tariff (per kWh)',
                              hintTex: 'Enter the tariff per kwh',
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),

                            ReusableTextField(
                              kontroller: energyCalculationModel.diversityController,
                              labText: 'Diversity Factor(value between o.6 and 1)',
                              hintTex: 'Enter a value between o.6 and 1',
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ReusableTextField(
                              kontroller: energyCalculationModel.noOfMonthsController,
                              labText: 'Duration (Month)',
                              hintTex: 'Enter the number of months',
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),

                            ElevatedButton(

                              onPressed: () {

                                if
                                (energyCalculationModel.availabilityController.text.isEmpty ||
                                    energyCalculationModel.tariffController.text.isEmpty ||
                                    energyCalculationModel.diversityController.text.isEmpty ||
                                    energyCalculationModel.noOfMonthsController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("All fields must be filled!")),
                                  );
                                  return;
                                }

                                try {
                                  var avail = double.parse(energyCalculationModel.availabilityController.text);
                                  var tariff = double.parse(energyCalculationModel.tariffController.text);
                                  var diversity = double.parse(energyCalculationModel.diversityController.text);
                                  var month = double.parse(energyCalculationModel.noOfMonthsController.text);

                                  if (avail <= 0 || tariff <= 0 || diversity <= 0 || month <= 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Values must be greater than zero!")),
                                    );
                                    return;
                                  }

                                  setState(() {
                                    energyCost = (energyCalculationModel.totalWattage / 1000) *
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
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shadowColor: Colors.black,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: const Color(0xFFA5672B),),
                              child: const Text("Calculate",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ),

                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              color:const Color(0xFFA5672B,),
                              child: Text(
                                "Total Wattage: ${energyCalculationModel.totalWattage.toStringAsFixed(2)} W",
                                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              color:const Color(0xFFA5672B,),
                              child: Text(
                                "Energy Cost: #${energyCost.toStringAsFixed(2)}",
                                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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



