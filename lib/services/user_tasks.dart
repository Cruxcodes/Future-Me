import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dio = Dio();

final getTaskList = FutureProvider.autoDispose((ref)async {
  try{
    final Response response;
    // response = await apiWatch.get("/flipping");
    // final List<dynamic> data = response.data["data"];
    // for (int i = 0; i < data.length; i++) {
    //   flippingProperties.add(FlippingModel.fromJson(data[i]));
    // }
    // print(flippingProperties);
    // return flippingProperties;
  }catch (e) {
    // Handle error
    // throw Exception("Failed to fetch crowdFund data: $e");
    return Future.error(e);
  }
});