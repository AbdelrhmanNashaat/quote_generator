import 'package:quote_generator/models/quote_model.dart';

abstract class GetQuoteState {}

class QuoteInitial extends GetQuoteState {}

class QuoteLoading extends GetQuoteState {
  final bool isLoading;

  QuoteLoading({this.isLoading = false});
}

class QuoteSuccess extends GetQuoteState {
  QuoteModel quoteModel;
  QuoteSuccess({
    required this.quoteModel,
  });
}

class QuoteFailure extends GetQuoteState {}

class QuoteFav extends GetQuoteState {}
