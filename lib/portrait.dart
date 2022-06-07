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

    return Container(
      margin: EdgeInsets.all(10.0),
      child:
          //EVERYTHING IS ARRANGED IN A COLUMN
          Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'VOLT(V):',
                  style: textStyle,
                ),
              ),
              Expanded(
                flex: 2,
                child:
                    //TEXTFIED PROPS. & STYLING
                    ReusableTextField(
                  kontroller: voltageController,
                  labText: 'Voltage',
                  hintTex: 'Enter 240 for voltage value',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'CURR(A):',
                  style: textStyle,
                ),
              ),
              Expanded(
                flex: 2,
                child:
                    //ANOTHER TEXTFIELD
                    ReusableTextField(
                  kontroller: currentController,
                  labText: 'Current',
                  hintTex: 'Enter current value',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'AVAIL(Hrs):',
                  style: textStyle,
                ),
              ),
              Expanded(
                flex: 2,
                child:
                    //ANOTHER TEXTFIELD
                    ReusableTextField(
                  kontroller: availabilityController,
                  hintTex: 'Enter availability',
                  labText: 'Availability',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'TAR(#):',
                  style: textStyle,
                ),
              ),
              Expanded(
                flex: 2,
                child:
                    //ANOTHER TEXTFIELD
                    ReusableTextField(
                  kontroller: tariffController,
                  labText: 'Tariff',
                  hintTex: 'Enter tariff',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'DURATION:',
                  style: textStyle,
                ),
              ),
              Expanded(
                flex: 2,
                child:
                    //ANOTHER TEXTFIELD
                    ReusableTextField(
                  kontroller: noOfMonthsController,
                  labText: 'Duration',
                  hintTex: 'Enter no. of months',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                //ELEVATEDBUTTON FOR  ADDITION
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFA5672B),
                  ),
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
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
                    });
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),

              //THE SIZEDBOX CREATE SPACE BETWEEN THE BUTTONS
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child:

                    //TO CLEAR THE  INPUT FIELDS AND RESULTS
                    ElevatedButton(
                  child: Text(
                    'RESET',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFA5672B),
                  ),
                  onPressed: () {
                    setState(() {
                      //THIS RESET THE INPUT FIELDS TO NULL AND THE RESULTS TO ZERO
                      voltageController.text = '';
                      currentController.text = '';
                      availabilityController.text = '';
                      tariffController.text = '';
                      noOfMonthsController.text = '';
                      powerResult = '0';
                      energyResult = '0';
                      lorResult = '0';
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //DISPLAYS THE WORD "POW" AS A STRING
                Text(
                  'POW:',
                  style: resultTextStyle,
                ),
                SizedBox(
                  width: 10.0,
                ),

                //THE POWER RESULT IS DISPLAYED HERE
                Text(
                  powerResult,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //DISPLAYS THE WORD "ENE" AS A STRING
                Text(
                  'ENE:',
                  style: resultTextStyle,
                ),
                SizedBox(
                  width: 10.0,
                ),

                //THE ENERGY RESULT IS DISPLAYED HERE
                Text(
                  energyResult,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //DISPLAYS THE WORD "LOR" AS A STRING
                Text(
                  'LOR:',
                  style: resultTextStyle,
                ),
                SizedBox(
                  width: 10.0,
                ),

                //THE LOR RESULT IS DISPLAYED HERE
                Text(
                  lorResult,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  ReusableTextField(
      {required this.kontroller, required this.hintTex, required this.labText});

  final TextEditingController kontroller;
  String labText;
  String hintTex;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: kontroller,
      style: TextStyle(
        fontSize: 14.0,
      ),
      minLines: 1,
      maxLines: 5,
      obscureText: false,
      decoration: InputDecoration(
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
          labelText: labText,
          hintText: hintTex),
    );
  }
}
