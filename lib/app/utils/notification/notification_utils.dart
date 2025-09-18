import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

class NotificationUtils {
  static const String CHANNEL_ID = "notification_channel";
  static const String CHANNEL_TITLE = "Notification Channel";
  static const String CHANNEL_DESCRIPTION =
      "This channel is used for general notifications.";
  static const Importance CHANNEL_IMPORTANCE = Importance.high;

  static const _key = "notification_status";

  final _box = GetStorage();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationUtils._();
  static final NotificationUtils _instance = NotificationUtils._();
  static NotificationUtils get instance => _instance;

  Future<void> initialize() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      CHANNEL_ID, // id
      CHANNEL_TITLE, // title
      description: CHANNEL_DESCRIPTION, // description
      importance: CHANNEL_IMPORTANCE,
      playSound: true,
    );

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    final ios = _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    await ios?.requestPermissions(alert: true, badge: true, sound: true);

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) async {
        print("Here");
      },
    );
  }

  void showNotification(String title, String body, {bool playSound = true}) {
    print("Notifikasi berhasil di lihat");
    _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          CHANNEL_ID,
          CHANNEL_TITLE,
          channelDescription: CHANNEL_DESCRIPTION,
          importance: Importance.high,
          playSound: playSound,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          presentSound: true,
          presentAlert: true,
          presentBadge: true,
        ),
      ),
      payload: 'Open from Local Notification',
    );
  }

  void dipose() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  bool getNotificationStatus() {
    bool? data = _box.read(_key);
    return data ?? false;
  }

  void updateNotification(bool notificationStatus) {
    _box.write(_key, notificationStatus);
  }
}
