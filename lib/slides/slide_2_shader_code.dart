import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ShaderCodeSlide extends FlutterDeckSlideWidget {
  const ShaderCodeSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/shader-code',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const Center(
        child: FlutterDeckCodeHighlight(
          code: '''
      import 'package:flutter/material.dart';
      import 'package:flutter_shader_snap/flutter_shader_snap.dart';
      ...
      class XState extends State<X> with SingleTickerProviderStateMixin {
        late final _controllerTextShader = AnimationController(
          vsync: this,
          duration: const Duration(seconds: 5),
        )..forward();
      
        @override
        Widget build(BuildContext context) {
          return Center(
        child: SnapShader(
          controller: _controllerTextShader,
          child: const Text(
            'Shaders',
            style: TextStyle(fontSize: 100),
          )));
        }
      }''',
          fileName: 'shader.dart',
          language: 'dart',
        ),
      ),
    );
  }
}
