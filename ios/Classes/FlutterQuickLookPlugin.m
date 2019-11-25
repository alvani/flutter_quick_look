#import "FlutterQuickLookPlugin.h"
#import <flutter_quick_look/flutter_quick_look-Swift.h>

@implementation FlutterQuickLookPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterQuickLookPlugin registerWithRegistrar:registrar];
}
@end
