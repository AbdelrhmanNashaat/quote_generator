import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quote_generator/models/quote_model.dart';
import 'package:quote_generator/services/quotes_service.dart';

import 'get_quote_state.dart';

class GetQuoteCubit extends Cubit<GetQuoteState> {
  QuoteModel? quoteModel;
  QuoteService quoteService;
  GetQuoteCubit({
    this.quoteModel,
    required this.quoteService,
  }) : super(QuoteInitial());
  void getRandomQuote() async {
    emit(QuoteLoading());
    try {
      quoteModel = await quoteService.fetchQuote();
      emit(QuoteSuccess(quoteModel: quoteModel!));
    } catch (ex) {
      emit(QuoteFailure());
      log(ex.toString());
    }
  }
}
