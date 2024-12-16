import 'package:api_client/api_client.dart';
import 'package:di_kit/di_kit.dart';
import 'package:monitoring_kit/monitoring_kit.dart';

Future<void> initDi() => initializeDIContainer([
      ..._utilityDIInitializers(),
      ..._featureDIInitializers(),
    ]);

List<DIInitializer> _utilityDIInitializers() => const [
      MonitoringDIInitializer(),
      ApiClientDIInitializer(),
    ];

List<DIInitializer> _featureDIInitializers() => const [];
