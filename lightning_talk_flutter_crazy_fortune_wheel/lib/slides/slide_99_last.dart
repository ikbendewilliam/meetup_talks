import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:google_fonts/google_fonts.dart';

class LastSlide extends FlutterDeckSlideWidget {
  final ValueNotifier<Offset> mousePosition = ValueNotifier(Offset.zero);

  LastSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/last',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.custom(
      builder: (context) => Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: MouseRegion(
          onHover: (event) => mousePosition.value = event.localPosition,
          onExit: (_) => mousePosition.value = Offset.zero,
          child: Stack(
            children: [
              Positioned.fill(
                child: FractionallySizedBox(
                  heightFactor: 0.7,
                  alignment: Alignment.bottomCenter,
                  child: LayoutBuilder(
                    builder: (context, constraints) => FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: constraints.maxWidth * 2,
                        height: constraints.maxHeight * 2,
                        child: _AnimatedShader(mousePosition: mousePosition),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: IgnorePointer(
                  child: Center(
                    child: ShaderBuilder(
                      assetKey: 'assets/shaders/neon_shader.frag',
                      (context, shader, child) => AnimatedSampler(
                        (image, size, canvas) {
                          shader
                            ..setFloat(0, size.width)
                            ..setFloat(1, size.height)
                            ..setImageSampler(0, image);
                          final paint = Paint()
                            ..shader = shader
                            ..blendMode = BlendMode.plus;
                          canvas.drawRect(
                            Rect.fromLTWH(0, 0, size.width, size.height),
                            paint,
                          );
                        },
                        child: child!,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // For the glow effect
                        child: Text(
                          'Lightning talk',
                          style: GoogleFonts.smoochSans().copyWith(
                            fontSize: 160,
                            color: const Color(0xFF7FE5FF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedShader extends StatefulWidget {
  final ValueNotifier<Offset> mousePosition;

  const _AnimatedShader({required this.mousePosition});

  @override
  State<_AnimatedShader> createState() => _AnimatedShaderState();
}

class _AnimatedShaderState extends State<_AnimatedShader> with SingleTickerProviderStateMixin {
  late final AnimationController _animation = AnimationController.unbounded(
    vsync: this,
    duration: const Duration(hours: 1),
  )..forward();

  late final _startTime = DateTime.now().millisecondsSinceEpoch;

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'assets/shaders/lightning_shader.frag',
      (context, shader, child) => ValueListenableBuilder(
        valueListenable: widget.mousePosition,
        builder: (context, mousePosition, _) => CustomPaint(
          painter: _ShaderPainter(
            shader: shader,
            animation: _animation,
            startTime: _startTime,
            mousePosition: mousePosition,
          ),
        ),
      ),
    );
  }
}

class _ShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final Animation<double> animation;
  final int startTime;
  final Offset mousePosition;

  _ShaderPainter({
    required this.shader,
    required this.animation,
    required this.startTime,
    required this.mousePosition,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    shader
      ..setFloat(0, size.width)
      ..setFloat(1, size.height)
      ..setFloat(2, mousePosition == Offset.zero ? 0.5 : mousePosition.dx * 2 / size.width)
      ..setFloat(3, mousePosition == Offset.zero ? 0 : mousePosition.dy / size.height)
      ..setFloat(4, (DateTime.now().millisecondsSinceEpoch - startTime) / 1000.0);

    final paint = Paint()..shader = shader;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
