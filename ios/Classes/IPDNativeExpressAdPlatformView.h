//
//  IPDNativeExpressAdPlatformView.h
//  ipdsdk_flutter
//
//  Created by Mountain King on 2022/10/9.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDNativeExpressAdPlatformView : NSObject<FlutterPlatformView>

@end

@interface IPDNativeExpressAdPlatformViewFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;
@end
NS_ASSUME_NONNULL_END
