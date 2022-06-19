import 'package:transmitter/core/services/service_exports.dart';

class ServiceInjector {
  LocationService locationService = LocationService();
  UtilityService utilityService = UtilityService();
  RouterService routerService = RouterService();
}

ServiceInjector si = ServiceInjector();
