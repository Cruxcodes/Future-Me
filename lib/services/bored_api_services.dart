import 'package:dio/dio.dart';
import 'package:future_me/model/BoredApi.dart';

final dio = Dio();

Future<BoredApi?> getBoredActivity() async {
  final BoredApi boredResponse = BoredApi();
  try {
    Response response = await dio.get("https://www.boredapi.com/api/activity");
    final data = response.data;
    return boredResponse;
  } catch (e) {
    return null;
  }
}
