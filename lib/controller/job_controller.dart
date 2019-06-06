import '../jobmap.dart';
import '../model/job.dart';
import '../util/mongo.dart';

class JobController extends ResourceController {
  JobController(this.context, this.agent);

  final ManagedContext context;
  final MongoAgent agent;

  @Operation.get()
  Future<Response> getJobs() async {
    return Response.ok(await agent.getCollection('jobs'));
  }

  @Operation.post()
  Future<Response> createJobUpdate() async {
    final Map decodedData = await request.body.decode();
    final search = decodedData['search'];
    final country = decodedData['country'];
    final count = decodedData['count'];
    final date = decodedData['date'];
    final newJob = Job(search, count, country, date);
    // TODO: add it to the mongodb
  }
}
