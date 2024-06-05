import 'package:appdynamics_agent/appdynamics_agent.dart';
import 'package:flutter/material.dart';

import 'app_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AgentConfiguration(
    appKey: appKey,
    collectorURL: "https://fra-col.eum-appdynamics.com/",
    screenshotsEnabled: false,
  );
  await Instrumentation.start(config);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              reproduceError();
            },
            child: const Text('Fail me!'),
          ),
        ),
      ),
    );
  }
}

Future<void> reproduceError() async {
  final tracker = await RequestTracker.create('https://google.com/');
  await tracker.setResponseStatusCode(200);
  await tracker.reportDone();
}
