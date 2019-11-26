//
//  UIView+QuickLookView.h
//  flutter_quick_look
//
//  Created by alpha2 on 25/11/19.
//
#import <QuickLook/QuickLook.h>
#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuickLookViewController : NSObject<FlutterPlatformView, QLPreviewControllerDataSource, QLPreviewControllerDelegate>
- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

- (UIView*)view;
@end

@interface QuickLookFactory : NSObject <FlutterPlatformViewFactory>
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END
