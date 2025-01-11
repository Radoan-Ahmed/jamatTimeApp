// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomAnimatedDropdown extends StatefulWidget {
  const CustomAnimatedDropdown({super.key});

  @override
  _CustomAnimatedDropdownState createState() => _CustomAnimatedDropdownState();
}

class _CustomAnimatedDropdownState extends State<CustomAnimatedDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _animation;
  bool isOpen = false;
  String selectedItem = "Select an option";
  List<String> options = ["Option 1", "Option 2"];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
     _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _heightAnimation = Tween<double>(begin: 0, end: options.length * 80.0)
        .animate(_controller);
  }

  void toggleDropdown() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void selectOption(String option) {
    setState(() {
      selectedItem = option;
      isOpen = false; // Close the dropdown
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Custom Animated Dropdown")),
      body: Center(
        child: GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            width: 200,
            padding: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey),
            //   borderRadius: BorderRadius.circular(8),
            // ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedItem),
                    Icon(isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  ],
                ),
                SizeTransition(
                  sizeFactor: _animation,
                  axisAlignment: -1.0,
                  child: Column(
                    children: options
                        .map(
                          (option) => GestureDetector(
                            onTap: () => selectOption(option),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.white,
                              child: Text(option),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
