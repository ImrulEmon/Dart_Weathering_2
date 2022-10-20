import 'dart:io';
import 'package:weathering/weatherCli.dart';

void weathering() {
  String? city;
  stdout.write('\u001b[34m Enter city Name : \u001b[0m');
  city = stdin.readLineSync();

  weatherCli(city);
}
