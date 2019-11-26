import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterQuickLook extends StatelessWidget {
  final String path;

  FlutterQuickLook(this.path);  

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> params = {
      'path': path,
    };
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'plugins.flutter.alva2.com/quicklook',
        creationParams: params,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } 
   return Text(
        '$defaultTargetPlatform is not yet supported by the quick look plugin'); 
  }
}
