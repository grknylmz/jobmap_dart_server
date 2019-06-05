import '../jobmap.dart';
import '../model/job.dart';
import '../util/mongo.dart';

class JobController extends ResourceController {
  JobController(this.context, this.agent);

  //@Bind.body()
  //Job job;

  final ManagedContext context;
  final MongoAgent agent;

  @Operation.get()
  Future<Response> getJobs() async {
    return Response.ok(await agent.getCollection('jobs'));
  }

  @Operation.post()
  Future<Response> createJobInfo() async {
    print('wait');
  }
}
