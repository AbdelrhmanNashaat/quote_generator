import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:quote_generator/cubit/add_quote_cubit/add_quote_cubit_state.dart';
import 'package:quote_generator/models/quote_model.dart';

class AddQuoteCubit extends Cubit<AddQuoteState> {
  AddQuoteCubit() : super(AddQuoteInitial());

  addQuote(QuoteModel quoteModel) async {
    try {
      var quotesBox = Hive.box<QuoteModel>('quote');
      await quotesBox.add(quoteModel);
      emit(AddQuoteSuccess());
    } catch (e) {
      emit(AddQuoteFailure(e.toString()));
    }
  }

  void resetState() {
    emit(AddQuoteInitial());
  }
}
