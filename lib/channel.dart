import 'controller/country_controller.dart';
import 'controller/glass_controller.dart';
import 'controller/indeed_controller.dart';
import 'controller/index_controller.dart';
import 'controller/job_controller.dart';
import 'controller/linkedin_controller.dart';
import 'controller/neuvoo_controller.dart';
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
    router.route("/").link(() => IndexController(context));
    router.route("/jobs").link(() => JobController(context, agent));
    router.route("/countries").link(() => CountryController(context));
    router.route("/indeed").link(() => IndeedController(context));
    router.route("/glass").link(() => GlassController(context));
    router.route("/neuvoo").link(() => NeuvooController(context));
    router.route("/linkedin").link(() => LinkedinController(context));
    return router;
  }

  //Connect to mlab Db
  Future _prepareDB() async {
    final config = ApplicationConfiguration(options.configurationFilePath);
    agent = MongoAgent.connect(config.url);
  }
}
