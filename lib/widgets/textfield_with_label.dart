import 'package:flutter/material.dart';

class TextfieldWithLabel extends StatelessWidget {
  final String label;

  TextfieldWithLabel(this.label);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        TextField(
            controller: controller,
            cursorColor: Colors.black,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              fillColor: Color.fromRGBO(250, 250, 250, 0.9),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ))
      ],
    );
  }
}
