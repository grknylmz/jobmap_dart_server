import 'dart:isolate';
import 'package:jobmap/util/web_scraper.dart';
import '../jobmap.dart';
import '../model/job.dart';
import '../util/mongo.dart';

class IndexController extends ResourceController {
  IndexController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> get() async {
    return Response.ok('Server is up!');
  }
}
