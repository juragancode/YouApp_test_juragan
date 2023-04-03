import 'package:flutter/material.dart';

class GoldText_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [
            Color.fromARGB(255, 208, 157, 56),
            Color(0xFFF3EDA6),
            Color(0xFFF8FAE5),
            Color(0xFFFFE2BE),
            Color.fromARGB(255, 234, 177, 45),
            Color(0xFFF8FAE5),
            Color(0xFFF8FAE5),
            Color.fromARGB(255, 237, 174, 29),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        "Tell everyone about yourself",
        style: TextStyle(
          fontSize: 18.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
