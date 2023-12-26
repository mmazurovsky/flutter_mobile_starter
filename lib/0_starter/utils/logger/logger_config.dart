import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@lazySingleton  
class LoggerConfig {
  LoggerConfig() {
    Logger.root.level = Level.ALL; // defaults to Level.INFO
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
