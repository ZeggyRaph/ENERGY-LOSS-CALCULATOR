import 'package:flutter/material.dart';

import '../main.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<Map<dynamic, dynamic>> buttons = [
    {'text': 'WATTS TO AMPS', 'route': '/third', Icon:Icons.power},
    {'text': 'AMP->WATT', 'route': '/fourth', Icon:Icons.electric_bolt_sharp},
    {'text': 'ENERGY THEFT CHARGES', 'route': '/second', Icon:Icons.alarm_on},
    {'text': 'LOSS OF REVENUE', 'route': '/fifth', Icon:Icons.payment},
    {'text': 'NEGATIVE KWH', 'route': '/sixth', Icon:Icons.nat},
    {'text': 'CALCULATOR', 'route': '/seventh', Icon:Icons.calculate},
    {'text': 'LOAD CALCULATOR', 'route': '/eighth', Icon:Icons.energy_savings_leaf},
  ];


  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child:
      Column(
        children: [

           Text('Select a module to continue',
            style: TextStyle(
                color: isDarkMode ? Colors.white : const Color(0xFFA5672B),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 2, // Adjust this for button size
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color(0xFFA5672B),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, buttons[index]['route']);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5,),
                        Icon(buttons[index][Icon],
                          color: isDarkMode ? Colors.white : Colors.white,
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          buttons[index]['text'],
                          style:  TextStyle(fontSize: 14.0,
                            color: isDarkMode ? Colors.white : Colors.white, ),
                          textAlign: TextAlign.center,

                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
