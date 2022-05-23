import 'package:exam_prep/const/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.onTap, required this.title, Key? key})
      : super(key: key);

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          color: CommonColor.baseColor,
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
