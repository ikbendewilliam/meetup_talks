import 'package:flutter/material.dart';
import 'package:flutter_crazy_fortune_wheel/flutter_crazy_fortune_wheel.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class RotationSlide extends FlutterDeckSlideWidget {
  const RotationSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/rotation',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => _RotationSlideContent(),
    );
  }
}

class _RotationSlideContent extends StatefulWidget {
  @override
  State<_RotationSlideContent> createState() => _RotationSlideContentState();
}

class _RotationSlideContentState extends State<_RotationSlideContent> with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..forward();

  late final _animation = CurvedAnimation(
    parent: _controller,
    curve: FortuneWheelCurve(),
  );

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) async {
      if (status != AnimationStatus.completed) return;
      await Future.delayed(const Duration(seconds: 5));
      if (!mounted) return;
      _controller.forward(from: 0.0);
    });
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
                  'Rotation and Animation',
                  style: GoogleFonts.smoochSans(
                    fontSize: 50,
                  ),
                ),
                const FlutterDeckCodeHighlight(
                  language: 'dart',
                  code: '''
animation.value * 2 * pi * (rotations - winnerIndex / children.length)

late final _controller = AnimationController( // Will be between 0 and 1
  vsync: this,
  duration: const Duration(seconds: 10),
)..forward();

late final _animation = CurvedAnimation( // Will be between -0.17 and 1.05
  parent: _controller,
  curve: FortuneWheelCurve(),
);
''',
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Image.asset('assets/images/curve.png'),
              ),
              Text(
                'https://cubic-bezier.com/#.09,-0.17,.6,1.05',
                style: GoogleFonts.smoochSans(fontSize: 30),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: NormalWheel(
                    winnerIndex: 1,
                    animation: _animation,
                    children: [
                      Text(
                        'Koen',
                        style: GoogleFonts.smoochSans(
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        'William',
                        style: GoogleFonts.smoochSans(
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        'Kris',
                        style: GoogleFonts.smoochSans(
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        'Jens',
                        style: GoogleFonts.smoochSans(
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
