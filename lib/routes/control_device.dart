import 'package:boomsender_flutter/models/models.dart';
import 'package:boomsender_flutter/sock.dart';
import 'package:boomsender_flutter/state.dart';
import 'package:boomsender_flutter/styles/styles.dart';
import 'package:boomsender_flutter/widgets/base_screen.dart';
import 'package:boomsender_flutter/widgets/button.dart';
import 'package:boomsender_flutter/widgets/dropdown_with_label.dart';
import 'package:boomsender_flutter/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ControlDevice extends ConsumerStatefulWidget {
  final Device device;
  const ControlDevice({Key? key, required this.device}) : super(key: key);

  @override
  _NewDeviceState createState() => _NewDeviceState();
}

class _NewDeviceState extends ConsumerState<ControlDevice> {
  dynamic sock;
  IPAddress? selectedIpAddress;
  Port? selectedPort;
  Command? selectedCommand;
  var waitForResponse = false;

  @override
  void initState() {
    super.initState();
    ref.read(ipAddressesProvider);
    ref.read(portsProvider);
  }

  onSend() {
    if (selectedIpAddress == null ||
        selectedPort == null ||
        selectedCommand == null) {
      return;
    }

    switch (widget.device.controlMethod) {
      case ControlMethodType.tcp:
        {
          sock = TCPSocket(selectedIpAddress!.ipAddress, selectedPort!.port);
          sock?.sendMessage(selectedCommand!.command, waitForResponse);
          sock?.destroy();
          break;
        }

      case ControlMethodType.udp:
        {
          sock = UDPSocket(selectedIpAddress!.ipAddress, selectedPort!.port);
          break;
        }
    }
  }

  changeWaitForResponse(bool value) {
    setState(() {
      waitForResponse = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ipAddresses = ref.watch(ipAddressesProvider);
    final ports = ref.watch(portsProvider);
    return BaseScreen(
      title: widget.device.name,
      child: Column(
        children: [
          DropdownWithLabel(
              label: "IP Address",
              currentValue: selectedIpAddress?.id,
              items: ipAddresses
                  .map((e) =>
                      DropdownMenuItem(child: Text(e.ipAddress), value: e.id))
                  .toList(),
              onChanged: <String>(id) {
                setState(() {
                  selectedIpAddress =
                      ipAddresses.firstWhere((element) => element.id == id);
                });
              }),
          DropdownWithLabel(
            label: "Port",
            currentValue: selectedPort?.id,
            items: ports
                .map((e) => DropdownMenuItem(
                    child: Text(e.port.toString()), value: e.id))
                .toList(),
            onChanged: <String>(id) => setState(() {
              selectedPort = ports.firstWhere((element) => element.id == id);
            }),
          ),
          DropdownWithLabel(
            label: "Command",
            currentValue: selectedCommand?.id,
            items: widget.device.commands
                ?.map((e) => DropdownMenuItem(child: Text(e.name), value: e.id))
                .toList(),
            onChanged: <String>(id) => setState(() {
              selectedCommand = widget.device.commands
                  ?.firstWhere((element) => element.id == id);
            }),
          ),
          responseWidget(
              this, widget.device.controlMethod == ControlMethodType.tcp),
          Button(
            label: "Send",
            onClick: onSend,
          ),
        ],
      ),
    );
  }
}

Widget responseWidget(_NewDeviceState state, bool show) {
  if (show == false) return const SizedBox.shrink();
  return Column(
    children: [
      const Label(label: "Response"),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(defaultMargin),
        width: double.infinity,
        height: 150,
        child: const Text(
          "ack\\x0A",
          style: TextStyle(color: Colors.black),
        ),
      ),
      Container(
        width: double.infinity,
        child: Row(children: [
          const Label(label: "Wait for response"),
          Switch(
            value: state.waitForResponse,
            onChanged: state.changeWaitForResponse,
          )
        ]),
      )
    ],
  );
}
