import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:future_me/constants/constants.dart';
import 'package:future_me/model/FutureMeAiModel.dart';

var dio = Dio();

var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $openAIApiKey',
  'Cookie':
      '__cf_bm=m6LK20FMYY0xg4imfykJqiMM8sYpbOgBM03MFZmaQbo-1714205534-1.0.1.1-41kNQ3g3UnaEYfzOfgJFQtW632b04UbMNl_DEnoVdR.LqTDY20TVGZnHpCzU7HcrD8FzrUlXimY5j7VdjIaY9w; _cfuvid=_Ou4askADtX0OO1yBKiaDQStx7GtckLIWBUTBM5qQTM-1714205534779-0.0.1.1-604800000'
};

Future<FutureMeModel?> fetchTasks(
    {required String futureWant,
    String? timeFrame,
    required String taskCount}) async {
  var data = json.encode({
    "model": "gpt-3.5-turbo",
    "n": 1,
    "messages": [
      {
        "role": "user",
        "content":
            "I want to become a $futureWant in ${timeFrame ?? "reasonable amount of time"}, give me a list of $taskCount tasks that I can do daily as an array to make this goal possible. Please make it only an array as I need to use it in an application. make it just an array"
      }
    ]
  });
  try {
    var response = await dio.request(
      'https://api.openai.com/v1/chat/completions',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      FutureMeModel futureMeModel = FutureMeModel.fromJson(response.data);
      return futureMeModel;
    } else {
      return null;
    }
  } catch (ex) {
    return Future.error(ex);
  }
}

Future<FutureMeModel?> fetchNewTasks(
    {required String futureWant,
    String? timeFrame,
    required String taskCount,
    required List<String> tasks}) async {
  var data = json.encode({
    "model": "gpt-3.5-turbo",
    "n": 1,
    "messages": [
      {
        "role": "user",
        "content":
            "I want to become a $futureWant in ${timeFrame ?? "reasonable amount of time"}, give me a list of $taskCount tasks that I can do daily as an array to make this goal possible. Please make it only an array as I need to use it in an application. make it just an array. I recieved this before ${tasks.toString()} and I don't like it"
      }
    ]
  });

  try {
    var response = await dio.request(
      'https://api.openai.com/v1/chat/completions',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      FutureMeModel futureMeModel = FutureMeModel.fromJson(response.data);
      return futureMeModel;
    } else {
      return null;
    }
  } catch (ex) {
    return Future.error(ex);
  }
}
