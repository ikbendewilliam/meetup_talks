import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_shader_snap/flutter_shader_snap.dart';

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
      builder: (context) => _ShaderSlideShader(),
    );
  }
}

class _ShaderSlideShader extends StatefulWidget {
  @override
  State<_ShaderSlideShader> createState() => _ShaderSlideShaderState();
}

class _ShaderSlideShaderState extends State<_ShaderSlideShader> with TickerProviderStateMixin {
  late final _controllerTextShader = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  );
  late final _controllerBackgroundShader = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  );

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 5));
    await _controllerTextShader.forward();
    await Future.delayed(const Duration(seconds: 5));
    await _controllerBackgroundShader.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
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
            fileName: 'code_highlight_slide.dart',
            language: 'dart',
          ),
        ),
        Positioned.fill(
          child: SnapShader(
            controller: _controllerBackgroundShader,
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.all(48),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: SnapShader(
              controller: _controllerTextShader,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Shaders',
                  style: TextStyle(fontSize: 100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
