import 'package:fare_riding_app/configs/mqtt_config.dart';

class MQTTManager {
  static final MQTTManager _instance = MQTTManager._internal();
  late MQTTConfig mqttService;

  factory MQTTManager() {
    return _instance;
  }

  MQTTManager._internal();

  Future<void> initialize({
    required String server,
    required int port,
    required String clientId,
    required String username,
    required String password,
  }) async {
    mqttService = MQTTConfig(
      server: server,
      port: port,
      clientId: clientId,
      username: username,
      password: password,
    );
    await mqttService.connect();
  }
}
