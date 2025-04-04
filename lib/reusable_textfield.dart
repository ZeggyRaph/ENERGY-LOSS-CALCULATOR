import 'package:flutter/material.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
         // textAlignVertical: TextAlignVertical(y: -0.0),

          keyboardType: TextInputType.number,
          controller: kontroller,
          style: const TextStyle(
            fontSize: 14.0,
          ),
          minLines: 1,
          maxLines: 5,
          obscureText: false,
          decoration: InputDecoration(
              filled: true,

             // contentPadding: const EdgeInsets.only(left: 200, right: 0, top: 0,bottom: 0),
              //contentPadding: EdgeInsets.only(bottom: 0.0),
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFA5672B,),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFFA5672B),
                    //width: 1.0
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              labelStyle: const TextStyle(
                color: Color(0xFFA5672B),
              ),
              labelText: labText,
              hintText: hintTex),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
