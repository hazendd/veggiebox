import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 360,
            height: 640,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFF43992D)),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 600.0,
                        height: 300.0,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
