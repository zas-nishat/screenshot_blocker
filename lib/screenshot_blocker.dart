import 'dart:async';
import 'package:flutter/services.dart';

class ScreenshotBlocker {
  static const MethodChannel _channel = MethodChannel('screenshot_blocker');
  static const EventChannel _eventChannel = EventChannel('screenshot_blocker_events');

  static Future<void> secureScreen() async {
    await _channel.invokeMethod('secureScreen');
  }

  static Future<void> clearSecureScreen() async {
    await _channel.invokeMethod('clearSecureScreen');
  }

  static Stream<void> onScreenshotTaken() {
    return _eventChannel.receiveBroadcastStream().map((_) => null);
  }
}
