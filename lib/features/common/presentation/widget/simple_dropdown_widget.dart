import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class SimpleDropdown extends StatelessWidget {
  final List<dynamic> items;
  final Function(String)? onChange;

  const SimpleDropdown({
    Key? key,
    required this.items,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<dynamic>(
      hintText: 'Select job role',
      items: items,
      initialItem: items[0],
      onChanged: (value) {
        log("the value is $value");
        if (onChange != null) {
          onChange!(value!);
        }
      },
    );
  }
}
