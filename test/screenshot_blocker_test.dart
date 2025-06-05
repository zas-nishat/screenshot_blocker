import 'package:flutter_test/flutter_test.dart';
import 'package:screenshot_blocker/screenshot_blocker.dart';
import 'package:screenshot_blocker/screenshot_blocker_platform_interface.dart';
import 'package:screenshot_blocker/screenshot_blocker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenshotBlockerPlatform
    with MockPlatformInterfaceMixin
    implements ScreenshotBlockerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenshotBlockerPlatform initialPlatform =
      ScreenshotBlockerPlatform.instance;

  test('$MethodChannelScreenshotBlocker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenshotBlocker>());
  });

  test('getPlatformVersion', () async {
    ScreenshotBlocker screenshotBlockerPlugin = ScreenshotBlocker();
    MockScreenshotBlockerPlatform fakePlatform =
        MockScreenshotBlockerPlatform();
    ScreenshotBlockerPlatform.instance = fakePlatform;

    // expect(await screenshotBlockerPluginreenshotBlockerPlugin.getPlatformVersion(), '42');
  });
}
