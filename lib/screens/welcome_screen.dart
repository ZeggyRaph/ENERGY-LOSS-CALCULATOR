import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      //padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(top: 50),
        margin: const EdgeInsets.all(10.0),
        child:
        //EVERYTHING IS ARRANGED IN A COLUMN
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: ElevatedButton(
              child: const Text(
                'WATTS TO AMPS',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                primary: const Color(0xFFA5672B),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),),
            const SizedBox(height: 50.0,),
            Expanded(child: ElevatedButton(
              child: const Text(
                'AMP->WATT->KW->KWH',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                primary: const Color(0xFFA5672B),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
            ),),
            const SizedBox(height: 50.0,),

            Expanded(child: ElevatedButton(
              child: const Text(
                'ENERGY THEFT CHARGES',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                primary: const Color(0xFFA5672B),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),),
            const SizedBox(height: 50.0,),

            Expanded(child: ElevatedButton(
              child: const Text(
                'LOSS OF REVENUE',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                primary: const Color(0xFFA5672B),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/fifth');
              },
            ),),
            const SizedBox(height: 50.0,),

            Expanded(child: ElevatedButton(
              child: const Text(
                'NEGATIVE KWH',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                primary: const Color(0xFFA5672B),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/sixth');
              },
            ),),
            const SizedBox(height: 50.0,),


            Expanded(child: ElevatedButton(
              child: const Text(
                'CALCULATOR',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                primary: const Color(0xFFA5672B),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/seventh');
              },
            ),),
             const SizedBox(height: 50.0,),


          ],
        ),

      ),
    );
  }
}







