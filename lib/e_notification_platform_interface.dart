import 'package:flutter/material.dart';

class ENotificationMessage {
  final String id;
  final String title;
  final String message;

  ENotificationMessage(
      {@required this.id, @required this.title, @required this.message});

  factory ENotificationMessage.fromJson(Map<String, dynamic> json) {
    return ENotificationMessage(
        id: json['id'],
        title: json['title'] as String,
        message: json['message'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'id': this.id, 'title': this.title, 'message': this.message};
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

  /// 消息前台 收到的 消息流
  Stream<ENotificationMessage> notificationMessageStream;

  /// 程序后台 收到的 消息流
  Stream<ENotificationMessage> backgroundNotificationMessageStream;

  /// 程序后台 点击 Notification 之后产生的数据流
  Stream<ENotificationMessage> notificationClickedStream;

  /// 设备 Token 消息流
  Stream<String> tokenStream;

  /// 关闭
  Future<void> close();
}
