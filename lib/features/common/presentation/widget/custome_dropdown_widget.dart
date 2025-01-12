import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class SimpleDropdown extends StatelessWidget {
  final List<dynamic> items;
  final Function(String)? onChange;
  final String? hintText;

  const SimpleDropdown({
    Key? key,
    required this.items,
    this.hintText,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> sortedData = List.from((items
    //           .map((e) =>  e.name)).toList());
    return CustomDropdown<dynamic>(
      hintText: hintText?? 'Select an option',
      items: items,
      // sortedData,
      // initialItem: items[0],
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value!);
        }
      },
    );
  }
}
