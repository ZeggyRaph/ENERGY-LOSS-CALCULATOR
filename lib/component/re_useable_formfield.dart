import 'package:flutter/material.dart';
class ListItem{
  int value;
  String name;
  ListItem(this.value, this.name);}

class ReUseableFormField extends StatefulWidget {
  const ReUseableFormField({Key? key}) : super(key: key);


  @override
  State<ReUseableFormField> createState() => _ReUseableFormFieldState();


  }

class _ReUseableFormFieldState extends State<ReUseableFormField> {


  int selectedPower = 1000;
  List<ListItem> dropdownItems = [
    ListItem(1000, "First Value"),
    ListItem(2000, "Second Item"),
    ListItem(3000, "Third Item"),
    ListItem(4000, "Fourth Item")
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(20),
    child:DropdownButton(
    value: selectedPower,
    items: dropdownItems.map((ListItem item) {
    return DropdownMenuItem<int>(
    child: Text(item.name),
    value: item.value,
    );
    }).toList(),
    onChanged: (newValue) {
    setState(() {
    selectedPower = selectedPower;
    });
    },
    ),
    );
  }
}
