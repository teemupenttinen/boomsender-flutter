import 'package:boomsender_flutter/models/models.dart';
import 'package:boomsender_flutter/routes/new_command.dart';
import 'package:boomsender_flutter/state.dart';
import 'package:boomsender_flutter/utils/control_method.dart';
import 'package:boomsender_flutter/widgets/base_screen.dart';
import 'package:boomsender_flutter/widgets/button.dart';
import 'package:boomsender_flutter/widgets/list/list_with_label.dart';
import 'package:boomsender_flutter/widgets/textfield_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class NewDevice extends ConsumerStatefulWidget {
  const NewDevice({Key? key}) : super(key: key);

  @override
  _NewDeviceState createState() => _NewDeviceState();
}

class _NewDeviceState extends ConsumerState<NewDevice> {
  int port = 80;
  String name = "";
  Set<ControlMethodType> selectedControlMethod = {ControlMethodType.tcp};
  List<Command> commands = [];

  onSave() {
    ref.read(devicesProvider.notifier).addDevice(Device(
          id: const Uuid().v4(),
          controlMethod: selectedControlMethod.first,
          name: name,
          port: Port(const Uuid().v4(), port),
          commands: commands,
        ));
    Navigator.pop(context);
  }

  onControlMethodChanged(Set<ControlMethodType> t) {
    setState(() {
      selectedControlMethod = t;
    });
  }

  onNameChanged(String value) {
    setState(() {
      name = value;
    });
  }

  onPortChanged(String value) {
    setState(() {
      var newPort = int.tryParse(value);
      if (newPort != null) {
        port = newPort;
      }
    });
  }

  newCommand(String name, String command) {
    setState(() {
      commands.add(Command(const Uuid().v4(), name, command));
    });
  }

  onAddNewCommand() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewCommand(onSave: newCommand),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "New device",
      child: Column(
        children: [
          TextfieldWithLabel(
            "Name:",
            (l) => setState(() => name = l),
            name,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Control method",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SegmentedButton(
                  segments: ControlMethodType.values
                      .map(
                        (e) => ButtonSegment(
                          value: e,
                          label: Text(controlMethodEnumToName(e)),
                          icon: null,
                        ),
                      )
                      .toList(),
                  selected: selectedControlMethod,
                  onSelectionChanged: onControlMethodChanged,
                ),
              ],
            ),
          ),
          TextfieldWithLabel("Port:", onPortChanged, port.toString()),
          ListWithLabel(
            label: "Commands",
            items: commands.map((e) => ListItemType(e.name, e.name)).toList(),
            onAdd: onAddNewCommand,
            onRemove: (id) {},
            onEdit: (id) {},
            onTapItem: (id) {},
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
