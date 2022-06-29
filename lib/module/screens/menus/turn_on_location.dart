import 'package:flutter/material.dart';
import 'package:transmitter/core/injector.dart';
import 'package:transmitter/main.dart';
import 'package:transmitter/module/screens/menu.dart';
import 'package:transmitter/shared/widgets/primary_button.dart';

import '../../../shared/theme/colors.dart';

class TurnOnLocation extends StatefulWidget {
  const TurnOnLocation({Key? key}) : super(key: key);

  @override
  State<TurnOnLocation> createState() => _TurnOnLocationState();
}

class _TurnOnLocationState extends State<TurnOnLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.only(top: 50, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    child: si.utilityService.svgImage(
                      'assets/svg/location.svg',
                      width: 200,
                      height: 300,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Turn on location',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Get access to live location of your device and other devices location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            PrimaryButton(
              title: 'Share location',
              onTap: () {
                si.locationService.getCoodinatesStream();
                si.routerService.nextRoute(
                  context,
                  const Menu(),
                );
              },
              hasBorder: false,
              titleColor: Colors.white,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
