import 'controller/country_controller.dart';
import 'controller/job_controller.dart';
import 'controller/indeed_controller.dart';
import 'package:cron/cron.dart';
import 'jobmap.dart';
import 'util/config.dart';
import 'util/mongo.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class JobmapChannel extends ApplicationChannel {
  ManagedContext context;
  MongoAgent agent;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    // TODO: schedule a scraping period for every day.
    _scheduleIndeedScrape();


    await _prepareDB();
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    router.route("/jobs").link(() => JobController(context, agent));
    router.route("/countries").link(() => CountryController(context));
    router.route("/indeed").link(() => IndeedController(context));
    return router;
  }

  //Connect to mlab Db
  Future _prepareDB() async {
    final config = ApplicationConfiguration(options.configurationFilePath);
    agent = MongoAgent.connect(config.url);
  }

  void _scheduleIndeedScrape() async {
    final cron = Cron();

    cron.schedule(Schedule.parse('*/1 * * * *'), () async {
      print('run every minute!');
    });
  }
}
