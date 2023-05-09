//
//  IPDContentImageTextPagePlatformView.h
//  ipdsdk_flutter
//
//  Created by 麻明康 on 2023/2/17.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <IPDSDK/IPDImageTextPage.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDContentImageTextPagePlatformView : NSObject<FlutterPlatformView,IPDContentPageHorizontalFeedCallBackDelegate,IPDImageTextDetailDelegate>

@end
@interface IPDContentImageTextPagePlatformViewFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;
@end
NS_ASSUME_NONNULL_END
