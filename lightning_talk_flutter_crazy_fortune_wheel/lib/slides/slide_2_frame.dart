import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class FrameSlide extends FlutterDeckSlideWidget {
  const FrameSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/frame',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => _FrameSlideContent(),
    );
  }
}

class _FrameSlideContent extends StatefulWidget {
  @override
  State<_FrameSlideContent> createState() => _FrameSlideContentState();
}

class _FrameSlideContentState extends State<_FrameSlideContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Frame',
                  style: GoogleFonts.smoochSans(
                    fontSize: 50,
                  ),
                ),
                const FlutterDeckCodeHighlight(
                  language: 'dart',
                  code: '''
AspectRatio 1
  FittedBox contain
    SizedBox 800 / scaling
      AnimatedBuilder(
        child: ColorWheel(
          children: children,
          colors: colors,
        ),
        builder: (context, child) => Stack(
          ColorWheel (animatedChild)
          ArrowWidget
...
class ColorWheel {
OvalClipper(
  Stack(
    For each segment:
    Align right (width 0.5)
      Rotate pi * 2 / children.length * i
        - Draw horizontal Line
        - Draw Dot
''',
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(64),
              child: AspectRatio(
                aspectRatio: 1,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    width: 800,
                    height: 800,
                    child: ColorWheel(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ColorWheel extends StatelessWidget {
  const ColorWheel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: Stack(
          children: [
            for (var i = 0; i < 4; i++) ...[
              Positioned.fill(
                child: Transform.rotate(
                  angle: 2 * pi * i / 4 - pi * 0.02,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Transform.rotate(
                  angle: 2 * pi * i / 4 - pi * 0.02,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.grey,
                            Colors.grey[700]!,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
              ),
            ),
            const Positioned.fill(
              child: WheelCenter(),
            ),
          ],
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  final int amountOfChildren;

  ArcClipper({required this.amountOfChildren});

  @override
  getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.arcTo(
      Rect.fromCircle(
        center: Offset(size.width, size.height / 2),
        radius: 999999,
      ),
      -pi / amountOfChildren,
      2 * pi / amountOfChildren,
      false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

class WheelCenter extends StatelessWidget {
  const WheelCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      heightFactor: 0.2,
      widthFactor: 0.2,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
    );
  }
}
