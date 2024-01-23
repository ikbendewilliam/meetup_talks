import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P3S07BuildConfig extends FlutterDeckSlideWidget {
  const P3S07BuildConfig()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/307',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      builder: (context) => Theme(
        data: ThemeData.dark(),
        child: const Center(
          child: FlutterDeckCodeHighlight(
            fileName: 'build.yaml',
            code: """builders:
          flutter_route_builder:
            import: "package:flutter_navigation_generator/builder.dart"
            builder_factories: ["flutterRouteBuilder"]
            build_extensions: { ".dart": [".navigator.json"] }
            auto_apply: dependents
            runs_before: ["flutter_navigation_generator|flutter_navigator_builder"]
            build_to: cache
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
