import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onClick;
  final String label;

  const Button({
    Key? key,
    required this.onClick,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed: onClick,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 184, 134, 74),
          ),
        ),
      ),
    );
  }
}
