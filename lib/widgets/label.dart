import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  const Label({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        label,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
