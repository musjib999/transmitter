import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:transmitter/core/injector.dart';
import 'package:transmitter/data/model/location_model.dart';
import 'package:transmitter/shared/global/global_var.dart';

class MqttConnection {
  MqttServerClient client =
      MqttServerClient.withPort('192.168.1.2', 'musjib999@gmail.com', 1883);
  Future<MqttServerClient> connectToMqttServer(
      {String server = '192.168.1.2', required String identifier
      // int port = 1883,
      }) async {
    // MqttServerClient client = MqttServerClient(server, '');
    client.logging(on: false);
    client.keepAlivePeriod = 5;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = (a) {
      print(a);
    };

    final connMessage = MqttConnectMessage()
        .withClientIdentifier("client-1")
        .withWillTopic('gps/status')
        .withWillMessage('{"email": ${currentUser.email}, "status": "offline"}')
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
    // ignore: avoid_print
    print('Connected to MQTT Server');
    // publishLocation();
    publishStatus(currentUser.email);
  }

  void onDisconnected() {
    // ignore: avoid_print
    print('Disconnected');
  }

  void publishLocation() async {
    final data = MqttClientPayloadBuilder();
    Stream<LocationModel> location = si.locationService.getCoodinatesStream();
    location.listen((location) {
      LocationModel previousLocation = location;

      if (previousLocation.latitude - location.latitude < 1) {
        print('Lat: ${previousLocation.latitude - location.latitude}');
      } else {
        data.addString(location.toJson().toString());
        client.publishMessage(
            'gps/location', MqttQos.atLeastOnce, data.payload!);
        data.clear();
      }
    });
  }

  void publishStatus(String email) async {
    final data = MqttClientPayloadBuilder();
    data.addString({"email": email, "status": "online"}.toString());
    client.publishMessage('gps/status', MqttQos.atLeastOnce, data.payload!);
    data.clear();
  }

  void disconnectServer() {
    client.disconnect();
  }
}
