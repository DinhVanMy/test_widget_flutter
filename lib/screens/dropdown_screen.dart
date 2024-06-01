import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final List<String> _dropDownItems = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six"
  ];
  String _selectedItem = "One";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Drop Down"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: DropdownButtonFormField(
          value: _selectedItem,
          items: _dropDownItems.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
              
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedItem = value!;
            });
          },
          icon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
