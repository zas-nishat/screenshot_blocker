import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screenshot_blocker_platform_interface.dart';

/// An implementation of [ScreenshotBlockerPlatform] that uses method channels.
class MethodChannelScreenshotBlocker extends ScreenshotBlockerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screenshot_blocker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
