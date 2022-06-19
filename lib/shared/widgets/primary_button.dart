import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color color, titleColor;
  final bool hasBorder;
  final void Function()? onTap;
  const PrimaryButton({
    Key? key,
    required this.title,
    this.titleColor = const Color(0xff266BFF),
    this.color = const Color(0xff266BFF),
    this.hasBorder = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
          border: hasBorder == true ? Border.all(color: titleColor) : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
