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
          'Weather in ${apiResult.name} ${String.fromCharCodes(rainBow)}');
      stdout.writeln('---------------------------------------');
      final date = DateTime.fromMillisecondsSinceEpoch(
          apiResult.dt!.toInt() * 1000,
          isUtc: true);
      final dateTimeString = '${date.day}.${date.month}.${date.year} :';
      final tempString =
          'Now : ${apiResult.main?.temp} ℃ , Feels like : ${apiResult.main?.feelsLike} ℃ , Min : ${apiResult.main?.tempMin} ℃ , Max : ${apiResult.main?.tempMax} ℃';
      stdout.writeln(dateTimeString);
      stdout.writeln(tempString);
      stdout.writeln('');
    } catch (e) {
      stderr.writeln('error : networking error');
      stderr.writeln(e.toString());
    }
  }
}
