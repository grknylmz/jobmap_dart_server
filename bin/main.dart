import 'package:jobmap/jobmap.dart';
import 'package:cron/cron.dart';


Future main() async {
  // Schedule the CRON job
  _scheduleIndeedScrape();

  final app = Application<JobmapChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}

void _scheduleIndeedScrape() async {

  final cron = Cron();


  cron.schedule(Schedule.parse('*/1 * * * *'), () async {
    print('run every minute!');
  });
}