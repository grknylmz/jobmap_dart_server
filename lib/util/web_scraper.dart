import 'dart:io';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'countries.dart';
import 'glass_helper.dart';
import 'neuvoo_helper.dart';

class WebScraper {
  Map<String, String> countryStatistics = <String, String>{};

  Future<dynamic> scrapeIndeed(String tag) async {
    for (var element in countries) {
      final prefix = element['url'].toString();
      if (prefix.isNotEmpty) {
        final url = prefix + tag;
        await getHtml(url).then((document) async {
          //Country Code
          final countryCode = element['country_code'].toString();
          //Job Count
          final count = parseJobCountry(
              document.querySelector('#searchCount').innerHtml, 1);

          countryStatistics[countryCode] = count;
          print('Added value Indeed:  ${countryStatistics}');
        });
      }
    }
    return countryStatistics;
  }

  Future<dynamic> scrapeGlass(String tag) async {
    for (var country in countries) {
      final url = GlassHelper.buildUrl(tag, country['glassLocId'].toString());
      await getHtml(url).then((document) async {
        //Country Code
        final countryCode = country['country_code'].toString();
        //Job Count
        final count = parseJobCountry(
            document.getElementById('MainColSummary').innerHtml, 0);
        countryStatistics[countryCode] = count;
        print('Added value GlassDoor:  ${countryStatistics}');
      });
    }
    return countryStatistics;
  }

  Future<dynamic> scrapeNeuvoo(String tag) async {
    for (var country in countries) {
      final countryCode = country['country_code'].toString();
      final url = NeuvooHelper.buildUrl(tag, countryCode);
      if (url.isNotEmpty) {
        await getHtml(url).then((document) async {
          //Job Count
          final count =
              parseJobCountry(document.getElementById('nv-count').innerHtml, 0);

          countryStatistics[countryCode] = count;
          print('Added value Neuvoo:  ${countryStatistics}');
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

  String parseJobCountry(String html, int pos) {
    final matchMap = RegExp(r'\b\d[\d,.]*\b').allMatches(html).toList();
    return html.substring(matchMap[pos].start, matchMap[pos].end);
  }
}
