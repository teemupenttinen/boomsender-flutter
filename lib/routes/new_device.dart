import 'package:flutter/material.dart';

class NewDevice extends StatefulWidget {
  const NewDevice({Key? key}) : super(key: key);

  @override
  State<NewDevice> createState() => _NewDeviceState();
}

class _NewDeviceState extends State<NewDevice> {
  @override
  Widget build(BuildContext context) {
    return Column(children: const [Text('Test')]);
  }
}
