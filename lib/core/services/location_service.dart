import 'dart:async';

import 'package:location/location.dart';
import 'package:transmitter/data/model/location_model.dart';

import '../../shared/global/global_var.dart';

class LocationService {
  final Location _location = Location();
  late PermissionStatus _permissionStatus;
  Future<LocationModel> getCoordinates() async {
    _permissionStatus = await _location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      await _location.requestPermission().then((value) async {
        if (value == PermissionStatus.granted) {
          await _location.getLocation().then((value) {
            currentLocation = LocationModel(
              latitude: value.latitude ?? 0.0,
              longitude: value.longitude ?? 0.0,
              email: currentUser.email,
            );
          });
        }
      });
    } else {
      await _location.getLocation().then((value) {
        currentLocation = LocationModel(
          latitude: value.latitude ?? 0.0,
          longitude: value.longitude ?? 0.0,
          email: currentUser.email,
        );
      });
    }
    return currentLocation;
  }

  Stream<LocationModel> getCoodinatesStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 4));
      LocationModel coodinates = await getCoordinates();
      yield coodinates;
    }
  }
}
