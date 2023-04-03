import 'package:flutter/material.dart';

class BlueText_Save extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [
            Color.fromARGB(255, 167, 236, 255),
            Color.fromARGB(255, 187, 207, 255),
            Color.fromARGB(255, 167, 236, 255),
            Color.fromARGB(255, 188, 215, 255),
            Color.fromARGB(255, 169, 196, 237),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        "Save",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
