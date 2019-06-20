import 'package:jobmap/util/web_scraper.dart';

import '../jobmap.dart';

class LinkedinController extends ResourceController {
  LinkedinController(this.context);
  final ManagedContext context;
  final WebScraper scraper = WebScraper();



  @Operation.get()
  Future<Response> getLinkedinData(@Bind.query('key') String keyword) async {
    final result = await scraper.scrapeLinkedin(keyword);
    return Response.ok('OK');
  }
}
