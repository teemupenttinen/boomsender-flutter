import '../models/models.dart';

final List<Device> mockDevices = [
  Device(
    id: "1",
    name: "Projector 1",
    port: Port("5", 1337),
    controlMethod: ControlMethodType.tcp,
    commands: [
      Command("1", "Power On", "power_on\x0a"),
      Command("2", "Power Off", "power_off\x0a"),
    ],
  ),
  Device(
    id: "2",
    name: "Projector 2",
    port: Port("6", 53215),
    controlMethod: ControlMethodType.udp,
    commands: [
      Command("1", "Power On", "power_on\x0a"),
      Command("2", "Power Off", "power_off\x0a"),
    ],
  ),
  Device(
    id: "3",
    name: "TV 1",
    port: Port("1", 1234),
    controlMethod: ControlMethodType.udp,
    commands: [
      Command("1", "Power On", "power_on\x0a"),
      Command("2", "Power Off", "power_off\x0a"),
    ],
  ),
];

final List<IPAddress> mockIpAddresses = [
  IPAddress("1", "192.168.1.10"),
  IPAddress("2", "127.0.0.1"),
  IPAddress("3", "192.168.100.10"),
];

final List<Port> mockPorts = [
  Port("1", 1234),
  Port("2", 3456),
  Port("3", 1245)
];
