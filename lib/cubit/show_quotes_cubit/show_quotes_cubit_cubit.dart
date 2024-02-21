import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quote_generator/models/quote_model.dart';

part 'show_quotes_cubit_state.dart';

class ShowQuotesCubitCubit extends Cubit<ShowQuotesCubitState> {
  ShowQuotesCubitCubit() : super(ShowQuotesCubitInitial());
  List<QuoteModel>? quotes;
  bool? isFav;
  fetchAllQuotes() {
    var quotesBox = Hive.box<QuoteModel>('quote');
    quotes = quotesBox.values.toList();
    emit(ShowQuotesCubitSuccessful());
    isFav = false;
  }

  void searchQuote({required String query}) {
    var filteredQuotes = quotes?.where((quote) {
      return quote.quote.toLowerCase().contains(query.toLowerCase()) ||
          quote.author.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(ShowQuotesCubitLoaded(
        quotes: filteredQuotes!)); // Update state with filtered list
  }
}
