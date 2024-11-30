// lib/mqtt_config.dart

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTConfig {
  final String server;
  final int port;
  final String clientId;
  final String username;
  final String password;
  MqttServerClient? _client;

  MQTTConfig({
    required this.server,
    required this.port,
    required this.clientId,
    required this.username,
    required this.password,
  });

  Future<void> connect() async {
    _client = MqttServerClient(server, clientId);
    _client!.port = port;
    _client!.logging(on: true);

    _client!.onConnected = onConnected;
    _client!.onDisconnected = onDisconnected;
    _client!.onSubscribed = onSubscribed;
    _client!.onSubscribeFail = onSubscribeFail;
    _client!.onUnsubscribed = onUnsubscribed;
    _client!.pongCallback = pong;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    print('Connecting...');
    _client!.connectionMessage = connMessage;

    try {
      await _client!.connect(username, password);
    } catch (e) {
      print('Exception: $e');
      _client!.disconnect();
    }

    if (_client!.connectionStatus!.state == MqttConnectionState.connected) {
      print('Connected');
    } else {
      print('ERROR: Connection failed - ${_client!.connectionStatus}');
      _client!.disconnect();
    }
  }

  void subscribe(String topic) {
    _client!.subscribe(topic, MqttQos.atMostOnce);
  }

  void unsubcribe(String topic) {
    _client!.unsubscribe(topic);
  }

  void publish(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client!.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  void handleUpdates(Function(List<MqttReceivedMessage<MqttMessage>>) callback) {
    _client!.updates!.listen(callback);
  }

  void onConnected() {
    print('Connected');
  }

  void onDisconnected() {
    print('Disconnected');
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }

  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

  void onUnsubscribed(String? topic) {
    print('Unsubscribed from $topic');
  }

  void pong() {
    print('Ping response client callback invoked');
  }

  void disconnect() {
    _client!.disconnect();
  }
}
