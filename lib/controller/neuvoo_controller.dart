import '../jobmap.dart';
import '../util/countries.dart';
import '../util/web_scraper.dart';

class NeuvooController extends ResourceController {
  NeuvooController(this.context);
  final ManagedContext context;
  final WebScraper scraper = WebScraper();



  @Operation.get()
  Future<Response> getIndeedData(@Bind.query('key') String keyword) async {
    final result = await scraper.scrapeNeuvoo(keyword);
    return Response.ok(result);
  }
}
