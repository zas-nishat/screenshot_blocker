import Flutter
import UIKit

public class ScreenshotBlockerPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  var eventSink: FlutterEventSink?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screenshot_blocker", binaryMessenger: registrar.messenger())
    let eventChannel = FlutterEventChannel(name: "screenshot_blocker_events", binaryMessenger: registrar.messenger())

    let instance = ScreenshotBlockerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    eventChannel.setStreamHandler(instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // iOS does not support FLAG_SECURE functionality
    result(nil)
  }

  public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = eventSink
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(screenshotTaken),
      name: UIApplication.userDidTakeScreenshotNotification,
      object: nil)
    return nil
  }

  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    NotificationCenter.default.removeObserver(self, name: UIApplication.userDidTakeScreenshotNotification, object: nil)
    self.eventSink = nil
    return nil
  }

  @objc private func screenshotTaken() {
    eventSink?(nil) // Send null event
  }
}
