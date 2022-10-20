import 'dart:io';
import 'package:weathering/api/api.dart';
import 'package:weathering/api/runes.dart';

Future weatherCli(String? city) async {
  if (city!.isEmpty) {
    stderr.writeln('error : city name missing');
  } else {
    try {
      final apiResult = await getWeather(city: city);

      stdout.writeln('');
      stdout.writeln(
          'Weather in \u001b[32m ${apiResult.name},${apiResult.sys?.country} \u001b[0m${String.fromCharCodes(rainBow)}');
      stdout.writeln('===========================================');
      final date = DateTime.fromMillisecondsSinceEpoch(
          apiResult.dt!.toInt() * 1000,
          isUtc: true);
      final dateTimeString =
          '\u001b[35m Date : ${date.day}.${date.month}.${date.year}\u001b[0m';
      final tempString =
          '\u001b[34m Now : ${apiResult.main?.temp} ℃ \u001b[0m,\u001b[36m Feels like : ${apiResult.main?.feelsLike} ℃ \u001b[0m,\u001b[32m Min : ${apiResult.main?.tempMin} ℃ \u001b[0m,\u001b[31m Max : ${apiResult.main?.tempMax} ℃ \u001b[0m';
      final condition = '\u001b[35m ${apiResult.weather?[0].main} \u001b[0m';
      stdout.writeln(dateTimeString);
      stdout.writeln(tempString);
      stdout.write(condition);

      if (condition == 'Thunderstorm') {
        print('${String.fromCharCodes(thunderStorm)}');
      } else if (condition == 'Rain') {
        print('${String.fromCharCodes(rain)}');
      } else if (condition == 'Snow') {
        print('${String.fromCharCodes(snow)}');
      } else if (condition == 'Clouds') {
        print('${String.fromCharCodes(clouds)}');
      } else if (condition == 'Clear') {
        print('${String.fromCharCodes(clear)}');
      } else if (condition == 'Drizzle') {
        print('${String.fromCharCodes(drizzle)}');
      } else {
        print('${String.fromCharCodes(others)}');
      }

      stdout.writeln('');
    } catch (e) {
      stderr.writeln('error : networking error');
      stderr.writeln(e.toString());
    }
  }
}
