import 'package:boomsender_flutter/styles/styles.dart';
import 'package:flutter/material.dart';

class TextfieldWithLabel extends StatefulWidget {
  final String label;
  final Function(String) onTextChanged;
  final String value;

  const TextfieldWithLabel(this.label, this.onTextChanged, this.value);

  @override
  State<TextfieldWithLabel> createState() => _TextfieldWithLabelState();
}

class _TextfieldWithLabelState extends State<TextfieldWithLabel> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: defaultMargin),
          child: Text(
            widget.label,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        TextField(
          controller: controller,
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 20, color: Colors.black),
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
          ),
          onChanged: widget.onTextChanged,
        )
      ],
    );
  }
}
