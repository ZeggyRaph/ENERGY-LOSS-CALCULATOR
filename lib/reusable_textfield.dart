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
