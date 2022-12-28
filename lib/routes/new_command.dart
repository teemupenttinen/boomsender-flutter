import 'package:boomsender_flutter/widgets/base_screen.dart';
import 'package:boomsender_flutter/widgets/button.dart';

import 'package:boomsender_flutter/widgets/textfield_with_label.dart';
import 'package:flutter/material.dart';

class NewCommand extends StatefulWidget {
  final Function(String, String) onSave;
  const NewCommand({Key? key, required this.onSave}) : super(key: key);

  @override
  _NewDeviceState createState() => _NewDeviceState();
}

class _NewDeviceState extends State<NewCommand> {
  String name = "";
  String command = "";

  onSave() {
    widget.onSave(name, command);
    Navigator.pop(context);
  }

  onNameChanged(String value) {
    setState(() {
      name = value;
    });
  }

  onCommandChanged(String value) {
    setState(() {
      name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "New command",
      child: Column(
        children: [
          TextfieldWithLabel(
            "Name:",
            (l) => setState(() => name = l),
            name,
          ),
          TextfieldWithLabel(
            "Command:",
            (l) => setState(() => command = l),
            command,
          ),
          Button(
            label: "Save",
            onClick: onSave,
          ),
        ],
      ),
    );
  }
}
