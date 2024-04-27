import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_me/model/QuotesModel.dart';

import 'bored_api_services.dart';

final getQuote = FutureProvider<Quotes>((ref) async {
  final Quotes quotes;
  try {
    Response response = await dio.get("https://zenquotes.io/api/random");
    quotes = Quotes.fromJson(response.data[0]);
    return quotes;
  } catch (e) {
    return Future.error(e);
  }
});
