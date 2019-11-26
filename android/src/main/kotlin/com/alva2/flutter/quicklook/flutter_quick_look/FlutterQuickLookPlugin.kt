package com.alva2.flutter.quicklook.flutter_quick_look

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterQuickLookPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_quick_look")
      channel.setMethodCallHandler(FlutterQuickLookPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {    
    result.notImplemented()
  }
}
