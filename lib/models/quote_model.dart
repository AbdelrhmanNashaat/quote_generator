import 'package:hive/hive.dart';
part 'quote_model.g.dart';

@HiveType(typeId: 0)
class QuoteModel extends HiveObject {
  @HiveField(0)
  final String quote;
  @HiveField(1)
  final String author;
  QuoteModel({
    required this.quote,
    required this.author,
  });
  factory QuoteModel.fromjson(Map<String, dynamic> data) {
    var jsonData = data;
    return QuoteModel(quote: jsonData['content'], author: data['author']);
  }
}
