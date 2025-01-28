import 'package:flutter/material.dart';
import 'package:flutter_crazy_fortune_wheel/flutter_crazy_fortune_wheel.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class ShaderSlide extends FlutterDeckSlideWidget {
  const ShaderSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/shader',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => _ShaderSlideContent(),
    );
  }
}

class _ShaderSlideContent extends StatefulWidget {
  @override
  State<_ShaderSlideContent> createState() => _ShaderSlideContentState();
}

class _ShaderSlideContentState extends State<_ShaderSlideContent> with TickerProviderStateMixin {
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
            child: Padding(
              padding: const EdgeInsets.all(64),
              child: SlicedWheel(
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
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(64),
              child: DisappearingWheel(
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
