import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quick_look/flutter_quick_look.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_quick_look');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterQuickLook.platformVersion, '42');
  });
}
