import '../jobmap.dart';
import '../util/countries.dart';
import '../util/web_scraper.dart';

class IndeedController extends ResourceController {
  IndeedController(this.context);
  final ManagedContext context;
  final WebScraper scraper = WebScraper();



  @Operation.get()
  Future<Response> getIndeedData(@Bind.query('key') String keyword) async {
    //final result = await scraper.scrapeIndeed(keyword);
    final result = await scraper.scrapeIndeed('jobs?q=abap&l');
    return Response.ok(result);
  }
}
