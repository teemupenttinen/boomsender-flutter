import 'package:boomsender_flutter/styles/styles.dart';
import 'package:boomsender_flutter/widgets/label.dart';
import 'package:flutter/material.dart';

class DropdownWithLabel extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem>? items;
  final Function<T>(T) onChanged;
  final String? currentValue;

  const DropdownWithLabel({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    required this.currentValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultMargin),
      child: Column(
        children: [
          Label(label: label),
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: double.infinity,
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                iconSize: 32,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconEnabledColor: Colors.black,
                alignment: Alignment.centerLeft,
                isExpanded: true,
                items: items,
                onChanged: onChanged,
                value: currentValue,
                dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
