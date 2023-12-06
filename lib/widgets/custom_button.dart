import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: Colors.greenAccent.shade200),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            color: Colors.black.withAlpha(168), fontWeight: FontWeight.bold),
      ),
    );
  }
}
