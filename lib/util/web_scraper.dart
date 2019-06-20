import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';

import '../model/countries.dart';
import '../model/glass_helper.dart';
import '../model/indeed_helper.dart';
import '../model/neuvoo_helper.dart';

class WebScraper {
  Map<String, String> countryStatisticsIndeed = <String, String>{};
  Map<String, String> countryStatisticsNeuvoo = <String, String>{};
  Map<String, String> countryStatisticsGlass = <String, String>{};

  Future<dynamic> scrapeLinkedin(String tag) async {
    final url = 'https://www.linkedin.com/login';

    try {
      final formData = FormData.from({
        'session_key': 'yilmaz.gurkan@hotmail.com.tr',
        'session_password': 'grk426333',
        'csrfToken': 'ajax:7320458600371952580'
      });
      var response = await Dio().post(url, data: formData);

      print(response);
    } catch (e) {
      print(e);
    }

    return countryStatisticsIndeed;
  }

  Future<dynamic> scrapeIndeed(String tag) async {
    for (var country in countries) {
      final countryCode = country['country_code'].toString();
      final url = IndeedHelper.buildUrl(tag, countryCode);
      if (url.isNotEmpty) {
        await getHtml(url).then((document) async {
          //Job Count
          final count = parseJobCountry(
              document.querySelector('#searchCount').innerHtml, 1);

          countryStatisticsIndeed[countryCode] = count;
          print('Added value Indeed:  ${countryStatisticsIndeed}');
        });
      }
    }
    return countryStatisticsIndeed;
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
        countryStatisticsGlass[countryCode] = count;
        print('Added value GlassDoor:  ${countryStatisticsGlass}');
      });
    }
    return countryStatisticsGlass;
  }

  Future<dynamic> scrapeNeuvoo(String tag) async {
    for (var country in countries) {
      final countryCode = country['country_code'].toString();
      final url = NeuvooHelper.buildUrl(tag, countryCode);
      if (url.isNotEmpty) {
        await getHtml(url).then((document) async {
          //Job Count
          final html = document.getElementById('nv-count').innerHtml;
          final count =
              parseJobCountry(document.getElementById('nv-count').innerHtml, 0);

          countryStatisticsNeuvoo[countryCode] = count;
          print('Added value Neuvoo:  ${countryStatisticsNeuvoo}');
        });
      }
    }
    return countryStatisticsNeuvoo;
  }

  Future<Document> getHtml(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((req) => req.close())
      .then((res) =>
          res.asyncExpand((bytes) => Stream.fromIterable(bytes)).toList())
      .then((bytes) => parse(bytes, sourceUrl: url));

  String parseJobCountry(String html, int pos) {
    final matchMap = RegExp(r'\b\d[\d,. ]*\b').allMatches(html).toList();
    return html.substring(matchMap[pos].start, matchMap[pos].end);
  }
}
