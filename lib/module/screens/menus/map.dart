import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transmitter/core/injector.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static double lat = 0.0;
  static double lng = 0.0;
  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? _markerIcon;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat, lng),
    zoom: 10.4746,
  );

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: LatLng(lat, lng),
        icon: _markerIcon!,
      );
    } else {
      return Marker(
        markerId: const MarkerId('marker_1'),
        position: LatLng(lat, lng),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    si.locationService.getCoodinatesStream().listen((value) {
      lat = value.latitude;
      lng = value.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: <Marker>{_createMarker()},
      ),
    );
  }
}
