import 'package:code_builder/code_builder.dart';

class LibraryGenerator {
  final String? message;

  LibraryGenerator({
    required this.message,
  });

  Library generate() {
    return Library(
      (b) => b
        ..body.addAll(
          [
            Class(
              (b) => b
                ..name = 'Example'
                ..methods.add(
                  Method(
                    (b) => b
                      ..name = 'printMessage'
                      ..lambda = true
                      ..body = Code("print('$message')"),
                  ),
                ),
            )
          ],
        ),
    );
  }
}
