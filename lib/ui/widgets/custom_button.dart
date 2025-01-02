import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final Function()? onTap;

  const CustomButton({
    Key? key,
    required this.text,
    this.color = AppColors.background1, // Default color
    required this.width, this.onTap // Default width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Default radius
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700, // Bold 700
          ),
        ),
      ),
    );
  }
}
