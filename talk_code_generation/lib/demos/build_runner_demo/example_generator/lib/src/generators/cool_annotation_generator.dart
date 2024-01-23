import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:example_annotations/example_annotations.dart';
import 'package:example_generator/src/code_builder/library_builder.dart';
import 'package:source_gen/source_gen.dart';

class CoolAnnotationGenerator extends GeneratorForAnnotation<CoolAnnotation> {
  @override
  dynamic generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    final navigatorClassName = annotation.peek('message')?.stringValue;

    final generator = LibraryGenerator(
      message: navigatorClassName,
    );

    final generatedLib = generator.generate();

    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

    return DartFormatter().format(generatedLib.accept(emitter).toString());
  }
}
