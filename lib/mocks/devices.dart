import '../models/models.dart';

final List<Device> mockDevices = [
  Device(
    id: "abc",
    name: "Projector 1",
    port: 1923,
    controlMethod: ControlMethodType.tcp,
  ),
  Device(
    id: "das",
    name: "Projector 2",
    port: 2012,
    controlMethod: ControlMethodType.udp,
  ),
  Device(
    id: "wqerq",
    name: "TV 1",
    port: 2012,
    controlMethod: ControlMethodType.udp,
  ),
];
