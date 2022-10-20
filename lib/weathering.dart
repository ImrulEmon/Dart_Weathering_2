import 'dart:io';
import 'package:weathering/weatherCli.dart';

void weathering() {
  String? city;
  stdout.write('Enter city Name : ');
  city = stdin.readLineSync();

  weatherCli(city);
}
