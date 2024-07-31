import 'package:flutter/material.dart';

class LineSlider extends StatelessWidget {
  const LineSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: 26,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}