import 'package:boomsender_flutter/mocks/devices.dart';
import 'package:boomsender_flutter/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Devices
final devicesProvider =
    StateNotifierProvider<DevicesState, List<Device>>((ref) {
  return DevicesState();
});

class DevicesState extends StateNotifier<List<Device>> {
  DevicesState() : super(mockDevices);
  void addDevice(Device newItem) => state = [...state, newItem];
  void removeDevice(String id) {
    state = state.where((element) => element.id != id).toList();
  }
}

// IP Addresses
final ipAddressesProvider =
    StateNotifierProvider<IPAddressesState, List<IPAddress>>((ref) {
  return IPAddressesState();
});

class IPAddressesState extends StateNotifier<List<IPAddress>> {
  IPAddressesState() : super(mockIpAddresses);
  void addIPAddress(IPAddress newItem) => [...state, newItem];
  void removeIPAddress(IPAddress item) =>
      state = state.where((element) => element.id != item.id).toList();
}

// Ports
final portsProvider = StateNotifierProvider<PortsState, List<Port>>((ref) {
  return PortsState();
});

class PortsState extends StateNotifier<List<Port>> {
  PortsState() : super(mockPorts);
  void addPort(Port newItem) => [...state, newItem];
  void removePort(Port item) =>
      state = state.where((element) => element.id != item.id).toList();
}
