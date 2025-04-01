import 'package:flutter/material.dart';

class LandscapeView extends StatefulWidget {
  const LandscapeView({Key? key}) : super(key: key);

  @override
  State<LandscapeView> createState() => _LandscapeViewState();
}

class _LandscapeViewState extends State<LandscapeView> {
  //DECLARING VARIABLES
  TextEditingController currentController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController tariffController = TextEditingController();
  TextEditingController noOfMonthsController = TextEditingController();
  String lorResult = '0';
  String energyResult = '0';
  String powerResult = '0';
  final vat = 1.075;
  final pf = 0.85;
  final kilo = 1000;
  final df = 0.6;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(height);

//Wrapping everything inside a gesture detector and using FocusScope.of(context).requestFocus(FocusNode()); enables the on screen keyboard to disappear when one taps anywhere outside the textfields.
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child:
              //EVERYTHING IS ARRANGED IN A COLUMN
              Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                child: Row(
                  children: [
                    Text(
                      'To make the keyboard disappear, Tap anywhere outside the input fields.',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'VOLT(V):',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                        //TEXTFIED PROPS. & STYLING
                        TextField(
                      keyboardType: TextInputType.number,
                      controller: voltageController,
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                      minLines: 1,
                      maxLines: 5,
                      autofocus: false,
                      obscureText: false,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFFA5672B),
                          ),
                          labelText: 'Voltage',
                          hintText: 'Enter 240 for voltage value'),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'CURR(A):',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                        //ANOTHER TEXTFIELD
                        TextField(
                      keyboardType: TextInputType.number,
                      controller: currentController,
                      style: const TextStyle(fontSize: 12.0),
                      minLines: 1,
                      maxLines: 5,
                      autofocus: false,
                      obscureText: false,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFFA5672B),
                          ),
                          labelText: 'Current',
                          hintText: 'Enter current value'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'AVAIL(Hrs):',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                        //ANOTHER TEXTFIELD
                        TextField(
                      keyboardType: TextInputType.number,
                      controller: availabilityController,
                      style: const TextStyle(fontSize: 12.0),
                      minLines: 1,
                      maxLines: 5,
                      autofocus: false,
                      obscureText: false,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFFA5672B),
                          ),
                          labelText: 'Availability',
                          hintText: 'Enter availability'),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'TAR(#):',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                        //ANOTHER TEXTFIELD

                        TextField(
                      keyboardType: TextInputType.number,
                      controller: tariffController,
                      style: const TextStyle(fontSize: 12.0),
                      minLines: 1,
                      maxLines: 5,
                      autofocus: false,
                      obscureText: false,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFFA5672B),
                          ),
                          labelText: 'Tariff',
                          hintText: 'Enter tariff'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'DURATION:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:
                        //ANOTHER TEXTFIELD
                        TextField(
                      keyboardType: TextInputType.number,
                      controller: noOfMonthsController,
                      style: const TextStyle(fontSize: 12.0),
                      minLines: 1,
                      maxLines: 5,
                      autofocus: false,
                      obscureText: false,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFA5672B),
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFFA5672B),
                          ),
                          labelText: 'Duration',
                          hintText: 'Enter no. of months'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    //ELEVATEDBUTTON FOR  ADDITION
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA5672B),
                        //Color(0xFFE18B22),
                        //#A5672B
                      ),
                      child: const Text(
                        'CALCULATE',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {
                        setState(() {
                          // FocusManager.instance.primaryFocus?.unfocus();
                          //ADDS AND GIVE RESULT THE TWO INPUT FIELDS
                          double power = double.parse(voltageController.text) *
                              double.parse(currentController.text) *
                              pf /
                              kilo;
                          double energy = power *
                              double.parse(availabilityController.text) *
                              double.parse(noOfMonthsController.text) *
                              df;
                          double lor = energy *
                              double.parse(tariffController.text) *
                              vat;
                          powerResult = power.toStringAsFixed(2);
                          energyResult = energy.toStringAsFixed(2);
                          lorResult = lor.toStringAsFixed(2);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),

                  //THE SIZEDBOX CREATE SPACE BETWEEN THE BUTTONS
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    //height: 60.0,
                    // padding: EdgeInsets.only(right: 10.0),
                    child:

                        //TO CLEAR THE TWO INPUT FIELDS AND RESULT
                        ElevatedButton(
                      child: const Text(
                        'RESET',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA5672B),
                      ),
                      onPressed: () {
                        setState(() {
                          //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULT TO ZERO
                          voltageController.text = '';
                          currentController.text = '';
                          availabilityController.text = '';
                          tariffController.text = '';
                          noOfMonthsController.text = '';
                          powerResult = '0';
                          energyResult = '0';
                          lorResult = '0';
                          // double result = double.parse(num1Controller.text) /
                          // double.parse(num2Controller.text);
                          //resultText = result.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'POW:',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE RESULT IS DISPLAYED HERE
                    Text(
                      powerResult,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      'ENE:',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE RESULT IS DISPLAYED HERE
                    Text(
                      energyResult,
                      style: const TextStyle(fontSize: 16.0),
                    ),

                    const Text(
                      'LOR:',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFFA5672B),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE RESULT IS DISPLAYED HERE
                    Text(
                      lorResult,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
