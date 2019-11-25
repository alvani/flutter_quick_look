import 'dart:async';

import 'package:flutter/services.dart';

class FlutterQuickLook {
  static const MethodChannel _channel =
      const MethodChannel('flutter_quick_look');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
