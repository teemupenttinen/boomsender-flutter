import '../models/models.dart';

String controlMethodEnumToName(ControlMethodType type) {
  switch (type) {
    case ControlMethodType.tcp:
      {
        return "TCP";
      }
    case ControlMethodType.udp:
      {
        return "UDP";
      }
  }
}
