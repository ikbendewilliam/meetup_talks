import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P2S08BuildConfig extends FlutterDeckSlideWidget {
  const P2S08BuildConfig()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/208',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.lightTheme,
      builder: (context) => Theme(
        data: ThemeData.light(),
        child: const Center(
          child: FlutterDeckCodeHighlight(
            fileName: 'build.yaml',
            code: """builders:
          flutter_navigator_builder:
            import: "package:flutter_navigation_generator/builder.dart"
            builder_factories: ["flutterNavigatorBuilder"]
            build_extensions: { ".dart": [".navigator.dart"] }
            auto_apply: dependents
            build_to: source""",
          ),
        ),
      ),
    );
  }
}
