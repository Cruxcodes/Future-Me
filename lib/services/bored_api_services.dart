import 'package:dio/dio.dart';
import 'package:future_me/model/BoredApi.dart';
import 'package:riverpod/riverpod.dart';

final dio = Dio();

final getSingleActivity =
    FutureProvider.family.autoDispose<BoredApi?, int>((ref, int number) async {
  {
    BoredApi boredResponse = BoredApi();
    try {
      Response response = await dio
          .get("https://www.boredapi.com/api/activity?participants=${number}");
      final data = response.data;
      boredResponse = BoredApi.fromJson(response.data);
      return boredResponse;
    } catch (e) {
      return null;
    }
  }
});
