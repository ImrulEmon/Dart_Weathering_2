import 'package:weathering/api/constants.dart';
import 'package:weathering/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

Future<ForeCast> getWeather({required String city}) async {
  var url = '${BASE_URL}q=$city${API_KEY_QUERY}';
  var response = await http.get(Uri.parse(url));
  var jsonResponse = json.decode(response.body);
  return ForeCast.fromJson(jsonResponse);
}
