import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class LastSlide extends FlutterDeckSlideWidget {
  const LastSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/last',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/pub_dev_snap.png',
                  height: 400,
                  width: 400,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'flutter_shader_snap',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/flutter_deck.png',
                  height: 400,
                  width: 400,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'flutter_deck',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/linkedin.png',
                  height: 400,
                  width: 400,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'LinkedIn',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
