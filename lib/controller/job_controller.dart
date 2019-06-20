import 'dart:isolate';
import 'package:jobmap/util/web_scraper.dart';
import '../jobmap.dart';
import '../model/job.dart';
import '../util/mongo.dart';

class JobController extends ResourceController {
  JobController(this.context, this.agent);

  final ManagedContext context;
  final WebScraper scraper = WebScraper();
  final MongoAgent agent;
  Isolate isolate;

  @Operation.get()
  Future<Response> getJobs(@Bind.query('key') String keyword) async {
    return Response.ok('Unauthorized!');
  }
  void checkResults() {}
}
