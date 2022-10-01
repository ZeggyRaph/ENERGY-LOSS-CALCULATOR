import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xFFA5672B),
);

const resultTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFFA5672B),
);

class PortraitView extends StatefulWidget {
  const PortraitView({Key? key}) : super(key: key);

  @override
  State<PortraitView> createState() => _PortraitViewState();
}

class _PortraitViewState extends State<PortraitView> {
  //DECLARING VARIABLES
  TextEditingController currentController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController tariffController = TextEditingController();
  TextEditingController noOfMonthsController = TextEditingController();
  TextEditingController meterType = TextEditingController();
  String lorResult = '0';
  String energyResult = '0';
  String powerResult = '0';
  String admResult = '0';
  String totalResult = '0';
  final vat = 1.075;
  final pf = 0.85;
  final kilo = 1000;
  final df = 0.6;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(10.0),
      child:
          //EVERYTHING IS ARRANGED IN A COLUMN
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'VOLTAGE(V)',
                  style: textStyle,
                ),
              ),
              Expanded(
                flex: 1,
                child:
                //TEXTFIED PROPS. & STYLING
                ReusableTextField(
                  kontroller: voltageController,
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
                  kontroller: currentController,
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
                  kontroller: availabilityController,
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
                  kontroller: tariffController,
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
                  kontroller: meterType,
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
                  kontroller: noOfMonthsController,
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
                    //ELEVATEDBUTTON FOR  ADDITION
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        primary: const Color(0xFFA5672B),
                      ),

                      child: const Text(
                        'CALCULATE',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        const singlephasePen = 50000;
                        const threePhasePen = 100000;
                        const singlephaseAdm = 1500;
                        const threePhaseAdm = 3000;

                        int? admInput;
                        int? penInput;

                        if (double.parse(meterType.text) == 1) {
                          admInput = singlephaseAdm;
                        } else {
                          admInput = threePhaseAdm;
                        }

                        if (double.parse(meterType.text) == 1) {
                          penInput = singlephasePen;
                        } else {
                          penInput = threePhasePen;
                        }

                        setState(() {
                          //THIS ENSURES THAT WHEN THE "CALCULATE BUTTON" IS CLICKED, THE SOFT KEYBOARD DISAPPEAR
                          FocusManager.instance.primaryFocus?.unfocus();
                          //THIS CALCULATE THE POWER
                          double power = double.parse(voltageController.text) *
                              double.parse(currentController.text) *
                              pf /
                              kilo;

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
                          //int admCharge = adm();
                          admResult = admInput.toString();

                          //TO CALCULATE PENALTY
                          //int? penCharge = pen();

                          //TO CALCULATE THE TOTAL
                          double total =
                              lor + admInput!.toDouble() + penInput!.toDouble();

                          totalResult = total.toStringAsFixed(2);
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
                    child:

                    //TO CLEAR THE  INPUT FIELDS AND RESULTS
                    ElevatedButton(
                      child: const Text(
                        'RESET',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        primary: const Color(0xFFA5672B),
                      ),
                      onPressed: () {
                        setState(() {
                          //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULTS TO ZERO
                          voltageController.text = '';
                          currentController.text = '';
                          availabilityController.text = '';
                          tariffController.text = '';
                          noOfMonthsController.text = '';
                          meterType.text = '';
                          powerResult = '0';
                          energyResult = '0';
                          lorResult = '0';
                          admResult = '0';
                          totalResult = '0';
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //DISPLAYS THE WORD "POW" AS A STRING
                    const Text(
                      'POW:',
                      style: resultTextStyle,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE POWER RESULT IS DISPLAYED HERE
                    Text(
                      powerResult,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //DISPLAYS THE WORD "ENE" AS A STRING
                    const Text(
                      'ENE:',
                      style: resultTextStyle,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE ENERGY RESULT IS DISPLAYED HERE
                    Text(
                      energyResult,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //DISPLAYS THE WORD "LOR" AS A STRING
                    const Text(
                      'LOR:',
                      style: resultTextStyle,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE LOR RESULT IS DISPLAYED HERE
                    Text(
                      lorResult,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //DISPLAYS THE WORD "LOR" AS A STRING
                    const Text(
                      'ADM:',
                      style: resultTextStyle,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE LOR RESULT IS DISPLAYED HERE
                    Text(
                      admResult,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //DISPLAYS THE WORD "LOR" AS A STRING
                    const Text(
                      'TOTAL:',
                      style: resultTextStyle,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                    //THE LOR RESULT IS DISPLAYED HERE
                    Text(
                      totalResult,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ],
          ),

    );
  }
}

// ignore: must_be_immutable
class ReusableTextField extends StatelessWidget {
  ReusableTextField(
      {Key? key,
      required this.kontroller,
      required this.hintTex,
      required this.labText})
      : super(key: key);

  final TextEditingController kontroller;
  String labText;
  String hintTex;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: kontroller,
      style: const TextStyle(
        fontSize: 14.0,
      ),
      minLines: 1,
      maxLines: 5,
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA5672B,),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA5672B), width: 1.0
            ),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          labelStyle: const TextStyle(
            color: Color(0xFFA5672B),
          ),
          labelText: labText,
          hintText: hintTex),
    );
  }
}
