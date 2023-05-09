//
//  IPDNativeExpressAdPlatformView.m
//  ipdsdk_flutter
//
//  Created by Mountain King on 2022/10/9.
//

#import "IPDNativeExpressAdPlatformView.h"
#import <IPDSDK/IPDNativeExpressFeedAdManager.h>
#import "IPDPlatformTool.h"

@interface IPDNativeExpressAdPlatformView()<FlutterStreamHandler,IPDNativeExpressFeedAdManagerDelegate,IPDNativeExpressFeedAdDelegate >
@property (nonatomic,strong)IPDNativeExpressFeedAdManager *feedAd;

@property (nonatomic, strong) UIView *containerView;
 
@property (nonatomic, strong) FlutterResult nativeExpressCallback;

@end

@implementation IPDNativeExpressAdPlatformView
- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
                    registrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    if (self = [super init]) {
        
        // 获取参数
        NSString *adId;
        CGFloat nativeExpressWidth = 0, nativeExpressHeight = 0;
        if ([args isKindOfClass:[NSDictionary class]]) {
            adId = args[@"adId"];
            nativeExpressWidth = [args[@"width"] floatValue];
            nativeExpressHeight = [args[@"height"] floatValue];
        }
        
        if (nativeExpressWidth <= 0.0) {
            nativeExpressWidth = [UIScreen mainScreen].bounds.size.width;
            nativeExpressHeight = nativeExpressWidth /(16/9);
        }


        // 加载nativeExpress
        if (!_feedAd) {
            _feedAd = [[IPDNativeExpressFeedAdManager alloc] initWithPlacementId:adId size:CGSizeMake(nativeExpressWidth, nativeExpressHeight)];
            _feedAd.delegate = self;
            _feedAd.mutedIfCan = YES;
        }
        [_feedAd loadAdDataWithCount:1];
        
//        [_bannerAd loadBannerAdWithFrame:CGRectMake(0, 0, bannerWidth, bannerHeight) viewController:[MobAdPlugin findCurrentShowingViewController] delegate:self interval:0 group:@"b1"];
        
        // 容器view
        _containerView = [[UIView alloc] initWithFrame:frame];
        _containerView.backgroundColor = [UIColor clearColor];
        
        // 事件通道
        NSString *channelName = [NSString stringWithFormat:@"com.ipdsdk.adsdk/native_express_event_%lld", viewId];
        FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:[registrar messenger]];
        [eventChannel setStreamHandler:self];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (nonnull UIView *)view {
    return _containerView;
}

- (FlutterError* _Nullable)onListenWithArguments:(NSString *_Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    NSLog(@"native express event -> listen");
    if (events) {
        self.nativeExpressCallback = events;
    }
    return nil;
}

- (FlutterError *)onCancelWithArguments:(id)arguments {
    NSLog(@"native express event -> cancel listen");
    return nil;
}
#pragma mark - IPDNativeExpressFeedAdManagerDelegate

#pragma mark - IPDNativeExpressFeedAdManagerDelegate
-(void)IPD_nativeExpressFeedAdManagerSuccessToLoad:(IPDNativeExpressFeedAdManager *)adsManager nativeAds:(NSArray<IPDNativeExpressFeedAd *> *)feedAdDataArray{

    IPDNativeExpressFeedAd *feedAd = feedAdDataArray[0];
    feedAd.rootViewController = [IPDPlatformTool findCurrentShowingViewController];
    feedAd.delegate = self;
    [feedAd render];
    
    UIView *view = [self.containerView viewWithTag:100];
    [view removeFromSuperview];
    feedAd.feedView.tag = 100;

    feedAd.feedView.frame = self.containerView.bounds;
    [self.containerView addSubview:feedAd.feedView];

    if (self.nativeExpressCallback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:@"nativeExpressAdViewDidLoad" forKey:@"event"];
        self.nativeExpressCallback(result);
    }
}

-(void)IPD_nativeExpressFeedAdManager:(IPDNativeExpressFeedAdManager *)adsManager didFailWithError:(NSError *)error{
    if (self.nativeExpressCallback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:@"nativeExpressAdDidLoadFail" forKey:@"event"];
        [result setObject:[self getErrorString:error] forKey:@"error"];
        self.nativeExpressCallback(result);
    }
    [self.containerView removeFromSuperview];
}

#pragma mark - IPDNativeExpressFeedAdDelegate
/**
 * 广告渲染成功
 */
- (void)IPD_nativeExpressFeedAdRenderSuccess:(IPDNativeExpressFeedAd *)feedAd{
    if (self.nativeExpressCallback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:@"nativeExpressAdRenderSuccess" forKey:@"event"];
        self.nativeExpressCallback(result);
    }
}
/**
 * 广告渲染失败
 */
- (void)IPD_nativeExpressFeedAdRenderFail:(IPDNativeExpressFeedAd *)feedAd{
    if (self.nativeExpressCallback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:@"nativeExpressAdRenderFail" forKey:@"event"];
        self.nativeExpressCallback(result);
    }
}

- (void)IPD_nativeExpressFeedAdViewWillShow:(IPDNativeExpressFeedAd *)feedAd{
    if (self.nativeExpressCallback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:@"nativeExpressAdViewWillShow" forKey:@"event"];
        self.nativeExpressCallback(result);
    }
}
- (void)IPD_nativeExpressFeedAdDidClick:(IPDNativeExpressFeedAd *)feedAd{
    if (self.nativeExpressCallback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:@"nativeExpressAdDidClick" forKey:@"event"];
        self.nativeExpressCallback(result);
    }
}
- (void)IPD_nativeExpressFeedAdDislike:(IPDNativeExpressFeedAd *)feedAd{
    if (self.nativeExpressCallback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:@"nativeExpressAdDislike" forKey:@"event"];
        self.nativeExpressCallback(result);
    }
}


- (void)IPD_nativeExpressFeedAdDidShowOtherController:(IPDNativeExpressFeedAd *)nativeAd{
    
}
- (void)IPD_nativeExpressFeedAdDidCloseOtherController:(IPDNativeExpressFeedAd *)nativeAd{
    
}



//#pragma mark - BannerAdDelegate
///**
// banner广告加载成功
// */
//- (void)ipd_bannerAdViewDidLoad:(IPDBannerAdView *)bannerAdView{
//    [self.containerView addSubview:bannerAdView];
//
//    if (self.bannerCallback) {
//        NSMutableDictionary *result = [NSMutableDictionary dictionary];
//        [result setObject:@"bannerAdViewDidLoad" forKey:@"event"];
//        self.bannerCallback(result);
//    }
//}
//
///**
// banner广告加载失败
// */
//- (void)ipd_bannerAdView:(IPDBannerAdView *)bannerAdView didLoadFailWithError:(NSError *_Nullable)error{
//    [self.containerView removeFromSuperview];
////    self.containerView = nil;
//    if (self.bannerCallback) {
//        NSMutableDictionary *result = [NSMutableDictionary dictionary];
//        [result setObject:@"bannerAdDidLoadFail" forKey:@"event"];
//        [result setObject:[self getErrorString:error] forKey:@"error"];
//        self.bannerCallback(result);
//    }
//}
//
-(NSString *)getErrorString:(NSError *)error{
    return [NSString stringWithFormat:@"错误信息:(%@-%ld)",error.domain,(long)error.code];
}
//
///**
// bannerAdView曝光回调
// */
//- (void)ipd_bannerAdViewWillBecomVisible:(IPDBannerAdView *)bannerAdView{
//    if (self.bannerCallback) {
//        NSMutableDictionary *result = [NSMutableDictionary dictionary];
//        [result setObject:@"bannerAdViewWillBecomVisible" forKey:@"event"];
//        self.bannerCallback(result);
//    }
//}
//
///**
// 关闭banner广告回调
// */
//- (void)ipd_bannerAdViewDislike:(IPDBannerAdView *)bannerAdView{
//    if (self.bannerCallback) {
//        NSMutableDictionary *result = [NSMutableDictionary dictionary];
//        [result setObject:@"bannerAdViewDislike" forKey:@"event"];
//        self.bannerCallback(result);
//    }
//}
//
///**
// 点击banner广告回调
// */
//- (void)ipd_bannerAdViewDidClick:(IPDBannerAdView *)bannerAdView{
//    if (self.bannerCallback) {
//        NSMutableDictionary *result = [NSMutableDictionary dictionary];
//        [result setObject:@"bannerAdViewDidClick" forKey:@"event"];
//        self.bannerCallback(result);
//    }
//}
//
///**
// 关闭banner广告详情页回调
// */
//- (void)ipd_bannerAdViewDidCloseOtherController:(IPDBannerAdView *)bannerAdView{
//    if (self.bannerCallback) {
//        NSMutableDictionary *result = [NSMutableDictionary dictionary];
//        [result setObject:@"bannerAdViewDidCloseOtherController" forKey:@"event"];
//        self.bannerCallback(result);
//    }
//}

@end

#pragma mark - PlatformViewFactory

@interface IPDNativeExpressAdPlatformViewFactory()
@property (nonatomic, strong) NSObject<FlutterPluginRegistrar> *registrar;
@end

@implementation IPDNativeExpressAdPlatformViewFactory

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    self = [super init];
    if (self) {
        _registrar = registrar;
    }
    return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    return [[IPDNativeExpressAdPlatformView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args registrar:_registrar];
}
@end
