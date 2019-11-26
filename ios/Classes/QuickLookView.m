//
//  UIView+QuickLookView.m
//  flutter_quick_look
//
//  Created by alpha2 on 25/11/19.
//

#import "QuickLookView.h"

@implementation QuickLookFactory {
  NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
  self = [super init];
  if (self) {
    _messenger = messenger;
  }
  return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
            viewIdentifier:(int64_t)viewId
                 arguments:(id _Nullable)args {
  QuickLookViewController* controller =
      [[QuickLookViewController alloc] initWithWithFrame:frame
                                       viewIdentifier:viewId
                                            arguments:args
                                      binaryMessenger:_messenger];
  return controller;
}

@end

@implementation QuickLookViewController {
    UIView* _view;
    QLPreviewController* _previewCtrl;
    NSString* _url;
}

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
  if ([super init]) {
    _previewCtrl = [[QLPreviewController alloc] init];
    _previewCtrl.delegate = self;
    _previewCtrl.dataSource = self;
    _view = _previewCtrl.view;
    _view.frame = frame;
    _url = args[@"path"];
  }
  return self;
}

- (UIView*)view {
  return _view;
}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", _url]];
}

#pragma mark - QLPreviewControllerDelegate

- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item {
    return YES;
}

@end
