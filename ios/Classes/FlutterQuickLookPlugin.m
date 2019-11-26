#import "FlutterQuickLookPlugin.h"
#import "QuickLookView.h"
//#import <flutter_quick_look/flutter_quick_look-Swift.h>

@interface Handler : NSObject<FlutterPlugin, QLPreviewControllerDelegate, QLPreviewControllerDataSource>
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar;
@end

@implementation Handler {
  NSString *url;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_quick_look" binaryMessenger:registrar.messenger];
  Handler* instance = [[Handler alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([call.method isEqualToString:@"openURL"]) {
    url = call.arguments[@"url"];
    NSLog(@"%@", url);
    UIViewController* a = [[[[UIApplication sharedApplication]delegate] window] rootViewController];
    UINavigationController* nav = (UINavigationController*)a;
    
    QLPreviewController* pc = [[QLPreviewController alloc] init];
    pc.delegate = self;
    pc.dataSource = self;
    [nav presentViewController:pc animated:TRUE completion:nil];
    
    result(url);
  }
}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", url]];
}

#pragma mark - QLPreviewControllerDelegate

- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item {
    return YES;
}

@end

@implementation FlutterQuickLookPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    QuickLookFactory* webviewFactory =
        [[QuickLookFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:webviewFactory withId:@"plugins.flutter.alva2.com/quicklook"];
  
  [Handler registerWithRegistrar:registrar];
}
@end
