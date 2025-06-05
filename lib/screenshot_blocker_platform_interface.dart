import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screenshot_blocker_method_channel.dart';

abstract class ScreenshotBlockerPlatform extends PlatformInterface {
  /// Constructs a ScreenshotBlockerPlatform.
  ScreenshotBlockerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenshotBlockerPlatform _instance = MethodChannelScreenshotBlocker();

  /// The default instance of [ScreenshotBlockerPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenshotBlocker].
  static ScreenshotBlockerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenshotBlockerPlatform] when
  /// they register themselves.
  static set instance(ScreenshotBlockerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
