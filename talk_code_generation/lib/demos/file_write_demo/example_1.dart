import 'dart:io';

void main() {
  var file = File('file.dart');
  file.writeAsStringSync('''
class Example {
  static printHelloWorld() => print('hello world');
}
''');
}
