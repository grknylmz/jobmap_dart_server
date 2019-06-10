import '../jobmap.dart';
import '../util/countries.dart';
import '../util/web_scraper.dart';

class IndeedController extends ResourceController {
  IndeedController(this.context);
  final ManagedContext context;
  final WebScraper scraper = WebScraper();



  @Operation.get()
  Future<Response> getIndeedData() async {
    final result = await scraper.scrape('jobs?q=abap&l');
    return Response.ok(result);
  }
}
