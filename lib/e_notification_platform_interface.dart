import 'dart:convert';

class ENotificationMessage {
  final String id;
  final String title;
  final String message;
  final int time;
  final Map<String, dynamic> payload;

  ENotificationMessage(
      {required this.id,
      required this.title,
      required this.message,
      required this.time,
      required this.payload});

  factory ENotificationMessage.fromJson(Map<String, dynamic> json) {
    return ENotificationMessage(
        id: json['id'],
        title: json['title'] as String,
        message: json['message'] as String,
        time: json['time'] as int,
        payload: json['payload'] ?? {});
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'time': this.time,
      'message': this.message,
      'payload': this.payload
    };
  }
}

abstract class ENotificationPlatformInterface {
  /// 初始化参数
  Future<void> init(Map<String, dynamic> params);

  /// 得到设备ID
  /// 下个版本将失效
  @deprecated
  Future<String> getDeviceId();

  /// 订阅 TOPIC
  Future<void> subscribe(String topic);

  /// 取消订阅 TOPIC
  Future<void> unsubscribe(String topic);

  /// 取消订阅所有
  Future<void> unsubscribeAll();

  /// 消息前台 收到的 消息流
  late Stream<ENotificationMessage> notificationMessageStream;

  /// 程序后台 收到的 消息流
  late Stream<ENotificationMessage> backgroundNotificationMessageStream;

  /// 程序后台 点击 Notification 之后产生的数据流
  late Stream<ENotificationMessage> notificationClickedStream;

  /// 设备 Token 消息流
  late Stream<String> tokenStream;

  /// 关闭
  Future<void> close();
}
