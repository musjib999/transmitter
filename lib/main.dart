import 'package:flutter/material.dart';
import 'package:transmitter/core/injector.dart';
import 'package:transmitter/data/model/location_model.dart';
import 'package:transmitter/data/source/mqtt.dart';
import 'package:transmitter/module/screens/auth/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MqttConnection mqttConnection = MqttConnection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transmitter'),
      ),
      body: StreamBuilder<LocationModel>(
        stream: si.locationService.getCoodinatesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print('Location Obj: ${snapshot.data!.toJson()}');
          LocationModel? position = snapshot.data;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Your current coodinate is',
                ),
                Text(
                  'Longitude: ${position!.longitude} and Latitude: ${position.latitude} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        mqttConnection.publishLocation();
                      },
                      color: Colors.blue,
                      child: const Text(
                        'Publsh Location',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 15),
                    MaterialButton(
                      onPressed: () {
                        mqttConnection.disconnectServer();
                      },
                      color: Colors.red,
                      child: const Text(
                        'Disconnect',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mqttConnection.connectToMqttServer(identifier: 'musjib@gmail.com');
        },
        tooltip: 'Location',
        child: const Icon(Icons.location_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
