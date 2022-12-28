import 'package:boomsender_flutter/routes/new_device.dart';
import 'package:boomsender_flutter/state.dart';
import 'package:boomsender_flutter/widgets/base_screen.dart';
import 'package:boomsender_flutter/widgets/list/list_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import 'control_device.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  // late final List<Device> devices;

  @override
  void initState() {
    super.initState();
    ref.read(devicesProvider);
  }

  onRemoveDevice(String id) {
    ref.read(devicesProvider.notifier).removeDevice(id);
  }

  onEditDevice(String id) {
    print("Edit device");
  }

  onTapListItem(Device device) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ControlDevice(device: device),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final devices = ref.watch(devicesProvider);
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListWithLabel(
            label: "Devices",
            items: devices.map((e) => ListItemType(e.name, e.id)).toList(),
            onAdd: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewDevice()),
              )
            },
            onRemove: onRemoveDevice,
            onEdit: onEditDevice,
            onTapItem: (value) => onTapListItem(
                devices.firstWhere((element) => element.id == value)),
          ),
        ],
      ),
      const Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "This space is reserved for your devices",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 24,
            ),
          ),
        ),
      ),
    ]);
  }
}
