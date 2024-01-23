import 'dart:io';

void main() {
  var file = File('file.dart');
  var content = file.readAsStringSync();
  content = content.replaceAll('hello world', 'hello Flutter Meetup');
  file.writeAsStringSync(content);
}
