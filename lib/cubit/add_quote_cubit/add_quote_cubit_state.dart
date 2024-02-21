abstract class AddQuoteState {}

class AddQuoteInitial extends AddQuoteState {}

class AddQuoteSuccess extends AddQuoteState {}

class AddQuoteFailure extends AddQuoteState {
  final String errMessage;

  AddQuoteFailure(this.errMessage);
}
