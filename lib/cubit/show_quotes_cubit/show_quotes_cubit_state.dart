part of 'show_quotes_cubit_cubit.dart';

sealed class ShowQuotesCubitState {}

final class ShowQuotesCubitInitial extends ShowQuotesCubitState {}

final class ShowQuotesCubitSuccessful extends ShowQuotesCubitState {}

final class ShowQuotesCubitLoaded extends ShowQuotesCubitState {
  final List<QuoteModel> quotes;

  ShowQuotesCubitLoaded({required this.quotes});
}
