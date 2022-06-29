import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UtilityService {
  Widget svgImage(String svgPath, {double? width, double? height}) {
    final Widget svg = SvgPicture.asset(
      svgPath,
      semanticsLabel: 'Location',
      width: width,
      height: height,
    );
    return svg;
  }
}
