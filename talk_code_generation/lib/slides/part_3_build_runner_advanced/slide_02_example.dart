import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P3S02Example extends FlutterDeckSlideWidget {
  const P3S02Example()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/302',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => Theme(
        data: ThemeData.dark(),
        child: const FlutterDeckCodeHighlight(
          fileName: 'main_navigator.dart',
          code: '''@flutterNavigator
class MainNavigator with BaseNavigator {}

// in other files
@FlutterRoute(
  returnType: bool,
  pageType: FadeInRoute,
)
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
...

@flutterDialog
class ExampleDialog extends StatelessWidget {
''',
        ),
      ),
      rightBuilder: (context) => Theme(
        data: ThemeData.dark(),
        child: const FlutterDeckCodeHighlight(
          fileName: 'result.navigator.dart',
          code: """mixin BaseNavigator {
  Future<bool?> goToSecondPage({_i1.Key? key}) async {
    final dynamic result = await navigatorKey.currentState?.pushNamed<dynamic>(
      RouteNames.secondPage,
      arguments: {'key': key},
    );
    return (result as bool?);
  }
...
  Future<void> showDialogExampleDialog({_i1.Key? key}) async =>
      showCustomDialog<dynamic>(widget: _i2.ExampleDialog(key: key));
...
}
""",
        ),
      ),
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      theme: Themes.darkTheme,
    );
  }
}
