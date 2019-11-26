#import "FlutterQuickLookPlugin.h"
#import "QuickLookView.h"

@implementation FlutterQuickLookPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    QuickLookFactory* webviewFactory =
        [[QuickLookFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:webviewFactory withId:@"plugins.flutter.alva2.com/quicklook"];
}
@end
