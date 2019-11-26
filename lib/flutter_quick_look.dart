import 'package:flutter/services.dart';

class FlutterQuickLook {
  static const MethodChannel _channel =
      const MethodChannel('flutter_quick_look');

  static openURL(String url) async {
    await _channel.invokeMethod('openURL', {'url': url});
  }
}