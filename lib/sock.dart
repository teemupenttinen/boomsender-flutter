import 'dart:convert';
import 'dart:io';

class TCPSocket {
  final String _ipAddress;
  final int _port;
  late final Socket _socket;

  TCPSocket(this._ipAddress, this._port);

  sendMessage(String message, bool? keepConnectionAlive) async {
    _socket = await Socket.connect(_ipAddress, _port);

    _socket.add(utf8.encode(message));
    if (keepConnectionAlive == null || keepConnectionAlive == false) {
      return await _socket.close();
    }

    // TODO: Handle events
    _socket.listen((event) async {
      print("Received: $event");
      await _socket.close();
    });
  }

  destroy() {
    _socket.destroy();
  }
}

class UDPSocket {
  final String _ipAddress;
  final int _port;

  UDPSocket(this._ipAddress, this._port);

  sendMessage(String message) async {
    RawDatagramSocket.bind(_ipAddress, _port).then((socket) {
      socket.send(utf8.encode(message), InternetAddress(_ipAddress), _port);
      socket.close();
    });
  }
}
