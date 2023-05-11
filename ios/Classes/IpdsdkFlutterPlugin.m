#import "IpdsdkFlutterPlugin.h"
#import "IPDSplashAdWrapper.h"
#import "IPDInterstitialAdWrapper.h"
#import "IPDH5AdWrapper.h"
#import "IPDRewardVideoAdWrapper.h"
#import "IPDBannerAdPlatformView.h"
#import "IPDContentListPagePlatformView.h"
#import "IPDContentFeedPagePlatformView.h"
#import "IPDContentHorizontalPagePlatformView.h"
#import "IPDContentImageTextPagePlatformView.h"

#import "IPDNativeExpressAdPlatformView.h"
#import "IPDPlatformTool.h"
#import "IPDImageTextVC.h"
#import "IPDContentListPageVC.h"
#import "IPDFeedPageVC.h"
#import "IPDHorizontalFeedPageVC.h"
@interface IpdsdkFlutterPlugin ()
@property (nonatomic,strong)IPDSplashAdWrapper *splashAd;
@property (nonatomic,strong)IPDRewardVideoAdWrapper *rewardVideoAd;
@property (nonatomic,strong)IPDInterstitialAdWrapper *interstitialAd;
@property (nonatomic,strong)IPDH5AdWrapper *h5Ad;

@property (nonatomic, strong) FlutterResult callback;

@property (nonatomic, assign) BOOL methodChannelCreated;

@end

@implementation IpdsdkFlutterPlugin
static IpdsdkFlutterPlugin *ipdsdkFlutterPlugin = nil;
+ (IpdsdkFlutterPlugin *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ipdsdkFlutterPlugin = [[self alloc] init];
    });
    return ipdsdkFlutterPlugin;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    IPDBannerAdPlatformViewFactory *bannerFactory = [[IPDBannerAdPlatformViewFactory alloc] initWithRegistrar:registrar];
    [registrar registerViewFactory:bannerFactory withId:@"com.ipdad.adsdk/banner"];
    
    IPDNativeExpressAdPlatformViewFactory *nativeExpressFactory = [[IPDNativeExpressAdPlatformViewFactory alloc] initWithRegistrar:registrar];
    [registrar registerViewFactory:nativeExpressFactory withId:@"com.ipdad.adsdk/nativeExpress"];
  
    IPDContentListPagePlatformViewFactory *contentListFactory = [[IPDContentListPagePlatformViewFactory alloc] initWithRegistrar:registrar];
    [registrar registerViewFactory:contentListFactory withId:@"com.ipdad.adsdk/contentVideoList"];
    
    IPDContentFeedPagePlatformViewFactory *contentFeedFactory = [[IPDContentFeedPagePlatformViewFactory alloc] initWithRegistrar:registrar];
    [registrar registerViewFactory:contentFeedFactory withId:@"com.ipdad.adsdk/contentVideoFeed"];
    
    IPDContentHorizontalPagePlatformViewFactory *contentHorizontalFactory = [[IPDContentHorizontalPagePlatformViewFactory alloc] initWithRegistrar:registrar];
    [registrar registerViewFactory:contentHorizontalFactory withId:@"com.ipdad.adsdk/contentVideoHorizontal"];

    IPDContentImageTextPagePlatformViewFactory *contentImageTextFactory = [[IPDContentImageTextPagePlatformViewFactory alloc] initWithRegistrar:registrar];
    [registrar registerViewFactory:contentImageTextFactory withId:@"com.ipdad.adsdk/contentVideoImageText"];
    
    [IpdsdkFlutterPlugin shareInstance].messenger = registrar.messenger;
    [IpdsdkFlutterPlugin shareInstance].methodChannel = [FlutterMethodChannel methodChannelWithName:@"com.ipdsdk.adsdk/method" binaryMessenger:registrar.messenger];
    [registrar addMethodCallDelegate:[IpdsdkFlutterPlugin shareInstance] channel:[IpdsdkFlutterPlugin shareInstance].methodChannel];
}


#pragma mark -- Flutter 交互监听
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    NSLog(@"ad plugin -> handleMethodCall:%@, args:%@", call.method, call.arguments);
    
    //监听flutter
    if ([[call method] isEqualToString:@"changeNativeTitle"]) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"changeNativeTitle" object:call.arguments];
    }
    if ([call.method isEqualToString:@"createIPDMethodChannel"]) {
       [self createIPDMethodChannel:call];
        return;
    }
    if(!_methodChannelCreated){
        [self createIPDMethodChannel:call];
    }
    // 调用方法
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    }else if ([call.method isEqualToString:@"setUserId"]) {
        //?? 没什么用？
        NSString *uid = call.arguments[@"userId"];
    }else if ([call.method isEqualToString:@"showSplashAd"]) {
        [self loadSplashAd:call];
    }else if ([call.method isEqualToString:@"registerIPDSDK"]) {
        [self registerIPDSDK:call];
    }else if (([call.method isEqualToString:@"showRewardVideoAd"])) {
        [self loadRewardVideoAd:call];
    }else if ([call.method isEqualToString:@"showInterstitialAd"]) {
        [self loadInterstitialAd:call];
    }else if ([call.method isEqualToString:@"showH5Ad"]) {
        [self loadH5Ad:call];
    }else if ([call.method isEqualToString:@"showContentVideoListPage"]) {
        [self showContentVideoListPage:call];
    }else if ([call.method isEqualToString:@"showContentVideoFeedPage"]) {
        [self showContentVideoFeedPage:call];
    }else if ([call.method isEqualToString:@"showContentVideoHorizontal"]) {
        [self showContentVideoHorizontal:call];
    }else if ([call.method isEqualToString:@"showContentVideoImageText"]) {
        [self showContentVideoImageText:call];
    }else{
        result(FlutterMethodNotImplemented);
    }
}
#pragma mark =============== 广告加载 ===============
-(void)createIPDMethodChannel:(FlutterMethodCall *)call{
    // 建立监听
    NSString *channelId = call.arguments[@"channelId"];
    if ([channelId isKindOfClass:[NSNumber class]]) {
        NSString *channel = [NSString stringWithFormat:@"com.ipdsdk.adsdk/event_%@", channelId];
        FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:channel binaryMessenger:[IpdsdkFlutterPlugin shareInstance].messenger];
        //设置FlutterStreamHandler协议代理
        [eventChannel setStreamHandler:[IpdsdkFlutterPlugin shareInstance]];

    }
}

/**开屏广告加载*/
-(void)loadSplashAd:(FlutterMethodCall *)call{
    //--------开屏广告--------
    __weak __typeof(self) weakSelf = self;
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    NSNumber *fetchDelay = [dic objectForKey:@"fetchDelay"];
    if (!self.splashAd) {
        self.splashAd = [[IPDSplashAdWrapper alloc]init];
    }
    //加载开屏广告
    [self.splashAd loadSplashAdWithAdId:adId fetchDelay:fetchDelay.floatValue];
    //开屏广告加载成功
    self.splashAd.splashAdDidLoad = ^{
        [weakSelf callbackWithEvent:@"splashAdDidLoad" otherDic:nil error:nil];
    };
    //开屏广告展示
    self.splashAd.splashAdSuccessPresentScreen = ^{
        [weakSelf callbackWithEvent:@"splashAdSuccessPresentScreen" otherDic:nil error:nil];
    };
    //开屏广告点击
    self.splashAd.splashAdClicked = ^{
        [weakSelf callbackWithEvent:@"splashAdClicked" otherDic:nil error:nil];
    };
    //开屏广告倒计时结束
    self.splashAd.splashAdCountdownEnd = ^{
        [weakSelf callbackWithEvent:@"splashAdCountdownEnd" otherDic:nil error:nil];
    };
    //开屏广告关闭
    self.splashAd.splashAdClosed = ^{
        [weakSelf callbackWithEvent:@"splashAdClosed" otherDic:nil error:nil];
    };
    self.splashAd.splashAdApplicationWillEnterBackground = ^{
        [weakSelf callbackWithEvent:@"splashAdApplicationWillEnterBackground" otherDic:nil error:nil];
    };
    //开屏广告错误-方便查看错误信息
    self.splashAd.splashAdError = ^(NSError * _Nonnull error) {
        [weakSelf callbackWithEvent:@"splashAdError" otherDic:nil error:error];
    };
}
/**激励视频加载*/
-(void)loadRewardVideoAd:(FlutterMethodCall *)call{
    //--------激励视频---------
    __weak __typeof(self) weakSelf = self;
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    NSString *userId = [dic objectForKey:@"userId"];
    if (!self.rewardVideoAd) {
        self.rewardVideoAd = [[IPDRewardVideoAdWrapper alloc]init];
    }
    //加载激励视频
    [self.rewardVideoAd loadRewardVideoAdWithAdId:adId userId:userId];
    //激励视频加载成功
    self.rewardVideoAd.rewardVideoLoadSuccess = ^{
        //广告加载成功-调用show
        [weakSelf.rewardVideoAd showRewardVideoAdWithViewController:[IPDPlatformTool findCurrentShowingViewController]];
        [weakSelf callbackWithEvent:@"rewardVideoLoadSuccess" otherDic:nil error:nil];
    };
    //奖励触发
    self.rewardVideoAd.rewardVideoDidRewardEffective = ^(NSString * _Nonnull transId,NSDictionary *validationDictionary) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:transId forKey:@"transId"];
        [dic setObject:validationDictionary forKey:@"validationDictionary"];
        [weakSelf callbackWithEvent:@"rewardVideoDidRewardEffective" otherDic:dic error:nil];
    };
    //视频广告各种错误信息回调
    self.rewardVideoAd.rewardVideoAdError = ^(NSError * _Nonnull error) {
        [weakSelf callbackWithEvent:@"rewardVideoAdError" otherDic:nil error:error];
    };
    //视频广告展示
    self.rewardVideoAd.rewardVideoAdDidShow = ^{
        [weakSelf callbackWithEvent:@"rewardVideoAdDidShow" otherDic:nil error:nil];
    };
    //视频播放页关闭
    self.rewardVideoAd.rewardVideoAdDidClose = ^{
        [weakSelf callbackWithEvent:@"rewardVideoAdDidClose" otherDic:nil error:nil];
    };
    //视频广告信息点击
    self.rewardVideoAd.rewardVideoAdDidClicked = ^{
        [weakSelf callbackWithEvent:@"rewardVideoAdDidClicked" otherDic:nil error:nil];
    };
    //视频广告视频播放完成
    self.rewardVideoAd.rewardVideoAdDidPlayFinish = ^{
        [weakSelf callbackWithEvent:@"rewardVideoAdDidPlayFinish" otherDic:nil error:nil];
    };
}

/**插屏广告加载*/
-(void)loadInterstitialAd:(FlutterMethodCall *)call{
    //--------插屏---------
    __weak __typeof(self) weakSelf = self;
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    if (!self.interstitialAd) {
        self.interstitialAd = [[IPDInterstitialAdWrapper alloc]init];
    }
    [self.interstitialAd loadInterstitialAdWithAdId:adId];
    self.interstitialAd.interstitialAdDidLoad = ^{
        [weakSelf.interstitialAd showInViewController:[IPDPlatformTool findCurrentShowingViewController]];
        [weakSelf callbackWithEvent:@"interstitialAdDidLoad" otherDic:nil error:nil];
    };
    self.interstitialAd.interstitialAdError = ^(NSError * _Nonnull error) {
        [weakSelf callbackWithEvent:@"interstitialAdError" otherDic:nil error:error];
    };
    self.interstitialAd.interstitialAdDidClick = ^{
        [weakSelf callbackWithEvent:@"interstitialAdDidClick" otherDic:nil error:nil];
    };
    self.interstitialAd.interstitialAdDidClose = ^{
        [weakSelf callbackWithEvent:@"interstitialAdDidClose" otherDic:nil error:nil];
    };
    self.interstitialAd.interstitialAdDidPresentScreen = ^{
        [weakSelf callbackWithEvent:@"interstitialAdDidPresentScreen" otherDic:nil error:nil];
    };
    self.interstitialAd.interstitialAdDetailDidClose = ^{
        [weakSelf callbackWithEvent:@"interstitialAdDetailDidClose" otherDic:nil error:nil];
    };
}

/**H5广告加载*/
-(void)loadH5Ad:(FlutterMethodCall *)call{
    //--------H5---------
    __weak __typeof(self) weakSelf = self;
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    NSString *userID = [dic objectForKey:@"userID"];
    NSString *userName = [dic objectForKey:@"userName"];
    NSString *userAvatar = [dic objectForKey:@"userAvatar"];
    NSNumber *userIntegral = [dic objectForKey:@"userIntegral"];
    NSString *ext = [dic objectForKey:@"ext"];
//    if (!self.h5Ad) {
        self.h5Ad = [[IPDH5AdWrapper alloc]init];
//    }
    IPDUser *user = [[IPDUser alloc]init];
    if ([userID isKindOfClass:[NSString class]] && userID) {
        user.userID = userID;
    }
    if ([userName isKindOfClass:[NSString class]] && userName) {
        user.userName = userName;
    }
    if ([userAvatar isKindOfClass:[NSString class]] && userAvatar) {
        user.userAvatar = userAvatar;
    }
    if ([userIntegral isKindOfClass:[NSNumber class]]) {
        user.userIntegral = userIntegral.integerValue;
    }
    if ([ext isKindOfClass:[NSString class]] && ext) {
        user.ext = ext;
    }
    
    self.h5Ad.onAdDidLoad = ^{
        [weakSelf.h5Ad showAdWithViewController:[IPDPlatformTool findCurrentShowingViewController]];
        [weakSelf callbackWithEvent:@"h5AdDidLoad" otherDic:nil error:nil];
    };
    self.h5Ad.onAdError = ^(NSError * _Nonnull error) {
        [weakSelf callbackWithEvent:@"h5AdError" otherDic:nil error:error];
    };
    self.h5Ad.onRewardAdDidLoad = ^ {
        [weakSelf callbackWithEvent:@"h5_rewardAdDidLoad" otherDic:nil error:nil];
    };
    self.h5Ad.onRewardAdRewardEffective = ^(NSString * _Nonnull transId) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:transId forKey:@"transId"];
        [weakSelf callbackWithEvent:@"h5_rewardAdRewardEffective" otherDic:dic error:nil];
    };
    self.h5Ad.onRewardAdDidClick = ^ {
        [weakSelf callbackWithEvent:@"h5_rewardAdRewardClick" otherDic:nil error:nil];
    };
    self.h5Ad.onRewardAdDidError = ^ (NSError * _Nonnull error){
        [weakSelf callbackWithEvent:@"h5_rewardAdRewardError" otherDic:nil error:error];
    };
    
    [self.h5Ad loadAdWithAdId:adId user:user];
}

#pragma mark =============== 视频内容各个样式 ===============
- (void)registerIPDSDK:(FlutterMethodCall *)call{
    NSDictionary  *dic = call.arguments;
    NSString *appId = [dic objectForKey:@"appId"];
    __weak __typeof(self) weakSelf = self;
    [IPDAdSDK setAppID:appId callback:^(BOOL completed, NSDictionary * _Nonnull info) {
        if(![info valueForKey:NSLocalizedDescriptionKey]){
            [info setValue:@" " forKey:NSLocalizedDescriptionKey];
        }
        if(completed){
            [weakSelf callbackWithEvent:@"registerComplete" otherDic:info error:nil];
        }else{
            [weakSelf callbackWithEvent:@"registerFail" otherDic:info error:nil];
        }
    }];
    [IPDAdSDK setLogLevel:IPDAdSDKLogLevelDebug];
    NSString *version = [IPDAdSDK SDKVersion];
    NSLog(@"IPDSDK version：%@",version);
}
/**视频内容列表*/
-(void)showContentVideoListPage:(FlutterMethodCall *)call{
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    IPDContentListPageVC *vc = [[IPDContentListPageVC alloc]init];
    vc.contentId = adId;
    __weak __typeof(self) weakSelf = self;
    vc.videoDidStartPlay = ^{
        [weakSelf callbackWithEvent:@"videoDidStartPlay" otherDic:nil error:nil];
    };
    vc.videoDidPause = ^{
        [weakSelf callbackWithEvent:@"videoDidPause" otherDic:nil error:nil];
    };
    vc.videoDidResume = ^{
        [weakSelf callbackWithEvent:@"videoDidResume" otherDic:nil error:nil];
    };
    vc.videoDidEndPlay = ^{
        [weakSelf callbackWithEvent:@"videoDidEndPlay" otherDic:nil error:nil];
    };
    vc.videoDidFailedToPlay = ^(NSError * _Nonnull error) {
        [weakSelf callbackWithEvent:@"videoDidFailedToPlay" otherDic:nil error:error];
    };
    vc.contentDidFullDisplay = ^{
        [weakSelf callbackWithEvent:@"contentDidFullDisplay" otherDic:nil error:nil];
    };
    vc.contentDidEndDisplay = ^{
        [weakSelf callbackWithEvent:@"contentDidEndDisplay" otherDic:nil error:nil];
    };
    vc.contentDidPause = ^{
        [weakSelf callbackWithEvent:@"contentDidPause" otherDic:nil error:nil];
    };
    vc.contentDidResume = ^{
        [weakSelf callbackWithEvent:@"contentDidResume" otherDic:nil error:nil];
    };
    [self presentNavViewcontroller:vc];
}

/**视频内容瀑布流*/
-(void)showContentVideoFeedPage:(FlutterMethodCall *)call{
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    IPDFeedPageVC *vc = [[IPDFeedPageVC alloc]init];
    vc.contentId = adId;
    __weak __typeof(self) weakSelf = self;
    vc.videoDidStartPlay = ^{
        [weakSelf callbackWithEvent:@"videoDidStartPlay" otherDic:nil error:nil];
    };
    vc.videoDidPause = ^{
        [weakSelf callbackWithEvent:@"videoDidPause" otherDic:nil error:nil];
    };
    vc.videoDidResume = ^{
        [weakSelf callbackWithEvent:@"videoDidResume" otherDic:nil error:nil];
    };
    vc.videoDidEndPlay = ^{
        [weakSelf callbackWithEvent:@"videoDidEndPlay" otherDic:nil error:nil];
    };
    vc.videoDidFailedToPlay = ^(NSError * _Nonnull error) {
        [weakSelf callbackWithEvent:@"videoDidFailedToPlay" otherDic:nil error:error];
    };
    vc.contentDidFullDisplay = ^{
        [weakSelf callbackWithEvent:@"contentDidFullDisplay" otherDic:nil error:nil];
    };
    vc.contentDidEndDisplay = ^{
        [weakSelf callbackWithEvent:@"contentDidEndDisplay" otherDic:nil error:nil];
    };
    vc.contentDidPause = ^{
        [weakSelf callbackWithEvent:@"contentDidPause" otherDic:nil error:nil];
    };
    vc.contentDidResume = ^{
        [weakSelf callbackWithEvent:@"contentDidResume" otherDic:nil error:nil];
    };
    [self presentNavViewcontroller:vc];
}

/**视频内容横版*/
-(void)showContentVideoHorizontal:(FlutterMethodCall *)call{
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    IPDHorizontalFeedPageVC *vc = [[IPDHorizontalFeedPageVC alloc]init];
    vc.contentId = adId;
    __weak __typeof(self) weakSelf = self;
    vc.videoDidStartPlay = ^{
        [weakSelf callbackWithEvent:@"videoDidStartPlay" otherDic:nil error:nil];
    };
    vc.videoDidPause = ^{
        [weakSelf callbackWithEvent:@"videoDidPause" otherDic:nil error:nil];
    };
    vc.videoDidResume = ^{
        [weakSelf callbackWithEvent:@"videoDidResume" otherDic:nil error:nil];
    };
    vc.videoDidEndPlay = ^{
        [weakSelf callbackWithEvent:@"videoDidEndPlay" otherDic:nil error:nil];
    };
    vc.videoDidFailedToPlay = ^(NSError * _Nonnull error) {
        [weakSelf callbackWithEvent:@"videoDidFailedToPlay" otherDic:nil error:error];
    };
    vc.contentDidFullDisplay = ^{
        [weakSelf callbackWithEvent:@"contentDidFullDisplay" otherDic:nil error:nil];
    };
    vc.contentDidEndDisplay = ^{
        [weakSelf callbackWithEvent:@"contentDidEndDisplay" otherDic:nil error:nil];
    };
    vc.contentDidPause = ^{
        [weakSelf callbackWithEvent:@"contentDidPause" otherDic:nil error:nil];
    };
    vc.contentDidResume = ^{
        [weakSelf callbackWithEvent:@"contentDidResume" otherDic:nil error:nil];
    };
    vc.horizontalFeedDetailDidEnter = ^{
        [weakSelf callbackWithEvent:@"horizontalFeedDetailDidEnter" otherDic:nil error:nil];
    };
    vc.horizontalFeedDetailDidLeave = ^{
        [weakSelf callbackWithEvent:@"horizontalFeedDetailDidLeave" otherDic:nil error:nil];
    };
    vc.horizontalFeedDetailDidAppear = ^{
        [weakSelf callbackWithEvent:@"horizontalFeedDetailDidAppear" otherDic:nil error:nil];
    };
    vc.horizontalFeedDetailDidDisappear = ^{
        [weakSelf callbackWithEvent:@"horizontalFeedDetailDidDisappear" otherDic:nil error:nil];
    };
    [self presentNavViewcontroller:vc];
}

/**视频内容瀑图文*/
-(void)showContentVideoImageText:(FlutterMethodCall *)call{
    NSDictionary  *dic = call.arguments;
    NSString *adId = [dic objectForKey:@"adId"];
    IPDImageTextVC *VC = [[IPDImageTextVC alloc]init];
    VC.contentId = adId;
    [self presentNavViewcontroller:VC];
}

-(void)presentNavViewcontroller:(UIViewController *)vc{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.modalPresentationStyle = 0;
    [ipd_getCurrentVC() presentViewController:nav animated:YES completion:nil];
}
#pragma mark =============== 回调给Flutter ===============
/**回调事件*/
-(void)callbackWithEvent:(NSString *)event otherDic:(NSDictionary *)otherDic error:(NSError *)error{
    if (self.callback) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [result setObject:event.length > 0 ?event :@"未知事件" forKey:@"event"];
        if(error){
            [result setObject:[error convertJSONString] forKey:@"error"];
        }else{
            [result setObject:@"" forKey:@"error"];
        }
        if (otherDic) {
            [result addEntriesFromDictionary:otherDic];
        }
        self.callback(result);
    }
}


- (void)dealloc {
    NSLog(@"ad plugin -> dealloc");
}
#pragma mark =============== 实现FlutterStreamHandler协议 ===============
- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
//    if([arguments isKindOfClass:[FlutterError class]]){
//        NSLog(@"FlutterError:code=%@,message=%@,details=%@,",[(FlutterError *)arguments code],[(FlutterError *)arguments message],[(FlutterError *)arguments details]);
//    }
//    NSLog(@"ad plugin -> onCancelListen:%@", arguments);
    return nil;
}

- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
//    NSLog(@"ad plugin -> onListen:%@", arguments);
//    if([arguments isKindOfClass:[FlutterError class]]){
//        NSLog(@"FlutterError:code=%@,message=%@,details=%@,",[(FlutterError *)arguments code],[(FlutterError *)arguments message],[(FlutterError *)arguments details]);
//    }
    if (events) {
        self.callback = events;
        
        if(!_methodChannelCreated){
            _methodChannelCreated = YES;
            [self callbackWithEvent:@"methodChannelCreated" otherDic:nil error:nil];
        }
    }
    return nil;
}

@end
