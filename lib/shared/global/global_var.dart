import 'package:flutter/material.dart';
import 'package:transmitter/data/model/user_model.dart';
import 'package:transmitter/main.dart';
import 'package:transmitter/module/screens/menus/map.dart';

import '../../data/model/location_model.dart';

late LocationModel currentLocation;
late UserModel currentUser;

List<Widget> appMenu = [
  const MyHomePage(),
  Container(),
  const MapScreen(),
  Container(),
];
