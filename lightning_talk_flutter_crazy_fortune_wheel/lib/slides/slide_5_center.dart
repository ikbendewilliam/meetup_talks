import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterSlide extends FlutterDeckSlideWidget {
  const CenterSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/center',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => _CenterSlideContent(),
    );
  }
}

class _CenterSlideContent extends StatefulWidget {
  @override
  State<_CenterSlideContent> createState() => _CenterSlideContentState();
}

class _CenterSlideContentState extends State<_CenterSlideContent> with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                  'Center',
                  style: GoogleFonts.smoochSans(
                    fontSize: 50,
                  ),
                ),
                const FlutterDeckCodeHighlight(
                  language: 'dart',
                  code: '''
Draw a white circle

final sweepAngle = 2 * pi / parts;
for (double angleStart = 0; angleStart < pi * 2; angleStart += sweepAngle) {
  final path = Path();
  path.moveTo(size.width / 2, size.height / 2);
  path.quadraticBezierTo(
    size.width / 2 - size.width / 4 * cos(pi / 2 + angleStart),
    size.height / 2 - size.width / 4 * sin(pi / 2 + angleStart),
    size.width / 2 - size.width / 2 * cos(sweepAngle / 2 + angleStart),
    size.height / 2 - size.width / 2 * sin(sweepAngle / 2 + angleStart),
  );
  path.arcToPoint(
    Offset(
      size.width / 2 - size.width / 2 * cos(angleStart),
      size.height / 2 - size.width / 2 * sin(angleStart),
    ),
    radius: Radius.circular(size.width / 2),
    largeArc: false,
    clockwise: false,
  );
  path.quadraticBezierTo(
    size.width / 2 - size.width / 4 * cos(pi / 2 + angleStart - sweepAngle / 2),
    size.height / 2 - size.width / 4 * sin(pi / 2 + angleStart - sweepAngle / 2),
    size.width / 2,
    size.height / 2,
  );
  canvas.drawPath(path, paint);
''',
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(64),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          for (int i = 3; i <= 8; i++) ...[
                            Expanded(
                              child: WheelCenter(parts: i),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          for (int i = 3; i <= 8; i++) ...[
                            Expanded(
                              child: Transform.rotate(
                                angle: 2 * pi * _controller.value,
                                child: WheelCenter(parts: i),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WheelCenter extends StatelessWidget {
  final int parts;

  const WheelCenter({
    required this.parts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      heightFactor: 0.3,
      widthFactor: 0.3,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: CustomPaint(
          painter: _SpiralPainter(parts: parts),
        ),
      ),
    );
  }
}

class _SpiralPainter extends CustomPainter {
  final int parts;

  _SpiralPainter({
    required this.parts,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );

    final sweepAngle = 2 * pi / parts;
    for (double angleStart = 0; angleStart < pi * 2; angleStart += sweepAngle) {
      final path = Path();
      path.moveTo(size.width / 2, size.height / 2);
      path.quadraticBezierTo(
        size.width / 2 - size.width / 4 * cos(pi / 2 + angleStart),
        size.height / 2 - size.width / 4 * sin(pi / 2 + angleStart),
        size.width / 2 - size.width / 2 * cos(sweepAngle / 2 + angleStart),
        size.height / 2 - size.width / 2 * sin(sweepAngle / 2 + angleStart),
      );
      path.arcToPoint(
        Offset(
          size.width / 2 - size.width / 2 * cos(angleStart),
          size.height / 2 - size.width / 2 * sin(angleStart),
        ),
        radius: Radius.circular(size.width / 2),
        largeArc: false,
        clockwise: false,
      );
      path.quadraticBezierTo(
        size.width / 2 - size.width / 4 * cos(pi / 2 + angleStart - sweepAngle / 2),
        size.height / 2 - size.width / 4 * sin(pi / 2 + angleStart - sweepAngle / 2),
        size.width / 2,
        size.height / 2,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
