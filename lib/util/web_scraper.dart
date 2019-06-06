import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'countries.dart';

class WebScraper {
  WebScraper(this.searchString);
  final String searchString;
  final Client client = Client();

  Future scrape(String tag) async {
    countries.forEach((element) async {
      if (element['url'] != null) {
        final reqUrl = element['url'].toString() + tag;
        final response = await client.get(reqUrl);
        final document = parse(response.body);
        final s = document.querySelector('#searchCount');
        print(element['name']);
        print(s.innerHtml);
        //s.children.forEach((element) => print(element));
      }
    });
  }
}
