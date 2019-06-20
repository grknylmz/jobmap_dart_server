import '../jobmap.dart';
import '../util/web_scraper.dart';

class GlassController extends ResourceController {
  GlassController(this.context);
  final ManagedContext context;
  final WebScraper scraper = WebScraper();

  @Operation.get()
  Future<Response> getGlassDoorData(@Bind.query('key') String keyword) async {
    final result = await scraper.scrapeGlass(keyword);
    return Response.ok(result);
  }
}
