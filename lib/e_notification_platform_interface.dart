class ENotificationMessage {
  final String id;
  final String title;
  final String message;

  ENotificationMessage(
      {required this.id, required this.title, required this.message});

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
  Future<String> getDeviceId();

  /// 得到 TAG
  Future<List<String>> getTags();

  /// 设置 TAG
  Future<String> setTag(String tag);

  /// 订阅 TOPIC
  Future<void> subscribe(String topic);

  /// 取消订阅 TOPIC
  Future<void> unsubscribe(String topic);

  /// 消息流
  abstract Stream<ENotificationMessage> notificationMessageStream;

  /// 程序后台之后，消息流
  abstract Stream<ENotificationMessage> backgroundNotificationMessageStream;

  Future<void> close();
}
