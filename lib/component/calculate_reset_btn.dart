import 'package:flutter/material.dart';

import '../main.dart';

class CalcResetBttn extends StatelessWidget {
  const CalcResetBttn({
    required this.btnText,
    required this.onPressedbtn,
    Key? key,
  }) : super(key: key);

  final String btnText;
  final Function onPressedbtn;


  @override
  Widget build(BuildContext context) {
    if(Theme.of(context).brightness == Brightness.light) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
         // shadowColor: Colors.black,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: const Color(0xFFA5672B),
        ),

        child: Text(
         btnText,
          style: const TextStyle(fontSize: 20.0,color: Colors.white),
        ),
        onPressed: () {
          onPressedbtn();
        },
      );
    }else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
         // shadowColor: Colors.white,

          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: const Color(0xFFA5672B),
        ),

         child: Text(
          btnText,
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          onPressedbtn();
        },
      );
    }
  }
}