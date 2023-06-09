import 'dart:io';

String fixture(String name) {
  var dir = Directory.current.path;
  dir = dir.replaceAll('\\', '/');
  return File('$dir/test/fixtures/$name').readAsStringSync();
}
