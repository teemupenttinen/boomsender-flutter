enum ControlMethodType {
  tcp,
  udp,
}

class Command {
  String id;
  String name;
  String command;

  Command(
    this.id,
    this.name,
    this.command,
  );
}

class Device {
  String id;
  String name;
  Port port;
  List<Command>? commands;
  ControlMethodType controlMethod;

  Device({
    required this.id,
    required this.name,
    required this.port,
    required this.controlMethod,
    this.commands,
  });
}

class IPAddress {
  String id;
  String ipAddress;

  IPAddress(
    this.id,
    this.ipAddress,
  );
}

class Port {
  String id;
  int port;

  Port(
    this.id,
    this.port,
  );
}
