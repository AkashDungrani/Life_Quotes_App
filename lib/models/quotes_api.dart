import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:life_quotes_app/models/quotes.dart';

class QuotesApiHelper {
  QuotesApiHelper._();

  static final QuotesApiHelper quotesApiHelper = QuotesApiHelper._();

  String url = "https://api.quotable.io/quotes";

  Future<QuotesAPI?> fetchRandomQuotes() async {
    http.Response res = await http.get(
      Uri.parse("https://api.quotable.io/random"),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> decodeData = jsonDecode(res.body);

      QuotesAPI randomQuotes = QuotesAPI.fromJSON(decodeData,
          "https://source.unsplash.com/random/1?background,nature,dark");

      return randomQuotes;
    }
    return null;
  }

  Future<List<QuotesAPI>?> fetchLatestQuotes() async {
    String url = "https://api.quotable.io/quotes";
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);

      List decodeData = data["results"];
      List<String> imageList = [];

      for (int i = 0; i < decodeData.length; i++) {
        imageList.add(
            "https://source.unsplash.com/random/${i + 1}?background,nature,dark");
      }
      List<QuotesAPI> latestQuotes = decodeData
          .map(
            (e) => QuotesAPI.fromJSON(
              e,
              imageList[decodeData.indexOf(e)],
            ),
          )
          .toList();

      return latestQuotes;
    }
    return null;
  }

  Future<List<QuotesAPI>?> fetchQuotes(
      {required bool isAuthCat, required String name}) async {
    String url = (isAuthCat)
        ? "https://api.quotable.io/quotes/?author=$name"
        : "https://api.quotable.io/quotes/?tags=$name";

    http.Response res = await http.get(
      Uri.parse(url),
    );
    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      List decodeData = data["results"];
      List<String> imagelList = [];
      for (int i = 0; i < decodeData.length; i++) {
        imagelList.add(
            "https://source.unsplash.com/random/${i + 1}?background,$name,dark");
      }
      List<QuotesAPI> quotesList = decodeData
          .map(
            (e) => QuotesAPI.fromJSON(
              e,
              imagelList[decodeData.indexOf(e)],
            ),
          )
          .toList();
      return quotesList;
    }
    return null;
  }
}
