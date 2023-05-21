import 'package:flutter/material.dart';

class SplashContainer extends StatelessWidget {
  final Color color;
  final Color color2;

  const SplashContainer(this.color, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.8),
            color2.withOpacity(0.4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
