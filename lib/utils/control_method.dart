import '../models/models.dart';

String controlMethodEnumToName(ControlMethodType type) {
  if (type == ControlMethodType.tcp) {
    return "TCP";
  }
  return "UDP";
}
