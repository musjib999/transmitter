import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttConnection {
  Future<MqttServerClient> connectToMqttServer(
      {String server = 'test.mosquitto.org', required String identifier
      // int port = 1883,
      }) async {
    // client = MqttServerClient.withPort(server, sensorId, port);
    MqttServerClient client = MqttServerClient(server, '');
    client.logging(on: false);
    client.keepAlivePeriod = 10;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = (a) {
      print(a);
    };

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(identifier)
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;
    try {
      await client.connect();
    } on SocketException catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    return client;
  }

  void onConnected() {
    print('Connected to MQTT Server');
  }

  void onDisconnected() {
    print('Disconnected');
  }
}
