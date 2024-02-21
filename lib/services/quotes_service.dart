import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quote_generator/models/quote_model.dart';

class QuoteService {
  Dio dio = Dio();
  Future<QuoteModel> fetchQuote() async {
    try {
      var response = await dio.get('https://api.quotable.io/random');
      QuoteModel quoteModel = QuoteModel.fromjson(response.data);
      return quoteModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['statusMessage'] ?? 'Dio Exception';
      log(e.toString());
      return throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      return throw Exception(
          'There was an error getting Quote. Please try again.');
    }
  }
}
