//
//  IPDBannerAdPlatformView.h
//  IPDSDK_flutter_demo
//
//  Created by Rare on 2021/5/11.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDBannerAdPlatformView : NSObject<FlutterPlatformView>



@end

@interface IPDBannerAdPlatformViewFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;
@end

NS_ASSUME_NONNULL_END
