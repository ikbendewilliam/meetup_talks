import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/cool_annotation_generator.dart';

Builder coolBuilder(BuilderOptions options) {
  return LibraryBuilder(CoolAnnotationGenerator(), generatedExtension: '.cool.dart');
}
