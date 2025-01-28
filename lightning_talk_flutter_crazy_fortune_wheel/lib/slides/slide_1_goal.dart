import 'package:flutter/material.dart';
import 'package:flutter_crazy_fortune_wheel/flutter_crazy_fortune_wheel.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalSlide extends FlutterDeckSlideWidget {
  const GoalSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/goal',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => _GoalSlideContent(),
    );
  }
}

class _GoalSlideContent extends StatefulWidget {
  @override
  State<_GoalSlideContent> createState() => _GoalSlideContentState();
}

class _GoalSlideContentState extends State<_GoalSlideContent> with TickerProviderStateMixin {
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
                  'Goal',
                  style: GoogleFonts.smoochSans(
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 20),
                ...[
                  '- Segment for each possible winner',
                  '- Dynamic segment amount',
                  '- "Flipper"',
                  '- Center',
                  '- Cool curve',
                  '- Add a shader?',
                ].map(
                  (text) => Text(
                    text,
                    style: GoogleFonts.smoochSans(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(64),
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
        ),
      ],
    );
  }
}
