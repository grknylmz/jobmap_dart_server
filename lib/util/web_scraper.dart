import 'dart:io';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'countries.dart';

class WebScraper {
  Map<String, String> countryStatistics = <String, String>{};

  Future<dynamic> scrape(String tag) async {
    for (var element in countries) {
      final prefix = element['url'].toString();
      if (prefix != 'null') {
        final url = prefix + tag;
        await getHtml(url).then((document) async {
          //Country Code
          final cc = element['country_code'].toString();
          //Job Count
          final count =
              parseJobCountry(document.querySelector('#searchCount').innerHtml);

          countryStatistics[cc] = count;
        });
      }
    }
    return countryStatistics;
  }

  Future<Document> getHtml(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((res) =>
          res.asyncExpand((bytes) => Stream.fromIterable(bytes)).toList())
      .then((bytes) => parse(bytes, sourceUrl: url));

  String parseJobCountry(String html) {
    final matchMap = RegExp(r'[0-9]+').allMatches(html).toList();
    return html.substring(matchMap[1].start, matchMap[1].end);
  }
}
