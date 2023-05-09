//
//  IPDContentFeedPagePlatformView.h
//  ipdsdk_flutter
//
//  Created by 麻明康 on 2023/2/17.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <IPDSDK/IPDFeedPage.h>

NS_ASSUME_NONNULL_BEGIN

@interface IPDContentFeedPagePlatformView : NSObject<FlutterPlatformView,IPDContentPageVideoStateDelegate,IPDContentPageStateDelegate>

@end
@interface IPDContentFeedPagePlatformViewFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;
@end
NS_ASSUME_NONNULL_END
