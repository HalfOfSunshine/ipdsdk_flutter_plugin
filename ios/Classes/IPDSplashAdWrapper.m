//
//  IPDAdWrapper.m
//  IPDSDK_flutter_demo
//
//  Created by Rare on 2021/3/25.
//

#import "IPDSplashAdWrapper.h"
#import <IPDSDK/IPDSDK.h>
@interface IPDSplashAdWrapper()<IPDSplashAdDelegate>

@property (nonatomic,strong)IPDSplashAd *splashAd;

@end
@implementation IPDSplashAdWrapper

-(void)loadSplashAdWithAdId:(NSString *)adId fetchDelay:(CGFloat)fetchDelay{
    self.splashAd = [[IPDSplashAd alloc]initWithPlacementId:adId];
    self.splashAd.fetchDelay = fetchDelay;
    self.splashAd.delegate = self;
    [self.splashAd loadAd];
    
}

-(void)showSplashAdInWindow:(UIWindow *)window withBottomView:(nullable UIView *)bottomView{
    [self.splashAd showAdInWindow:window];
}

#pragma mark - IPDSplashAdDelegate
/**
 *  开屏广告素材加载成功
 */
-(void)ipd_splashAdDidLoad:(IPDSplashAd *)splashAd{
    
    [self showSplashAdInWindow:[UIApplication sharedApplication].windows.firstObject withBottomView:nil];
    if (self.splashAdDidLoad) {
        self.splashAdDidLoad();
    }
}

/**
 *  开屏广告成功展示
 */
-(void)ipd_splashAdSuccessPresentScreen:(IPDSplashAd *)splashAd{
    if (self.splashAdSuccessPresentScreen) {
        self.splashAdSuccessPresentScreen();
    }
}

/**
 *  开屏广告点击回调
 */
- (void)ipd_splashAdClicked:(IPDSplashAd *)splashAd{
    if (self.splashAdClicked) {
        self.splashAdClicked();
    }
}

/**
 *  开屏广告关闭回调
 */
- (void)ipd_splashAdClosed:(IPDSplashAd *)splashAd{
    if (self.splashAdClosed) {
        self.splashAdClosed();
    }
}

/**
 *  应用进入后台时回调
 *  详解: 当点击下载应用时会调用系统程序打开，应用切换到后台
 */
- (void)ipd_splashAdApplicationWillEnterBackground:(IPDSplashAd *)splashAd{
    if (self.splashAdApplicationWillEnterBackground) {
        self.splashAdApplicationWillEnterBackground();
    }
}

/**
 * 开屏广告倒记时结束
 */
- (void)ipd_splashAdCountdownEnd:(IPDSplashAd*)splashAd{
    if (self.splashAdCountdownEnd) {
        self.splashAdCountdownEnd();
    }
}

/**
 *  开屏广告错误
 */
- (void)ipd_splashAdError:(IPDSplashAd *)splashAd withError:(NSError *)error{
    if (self.splashAdError) {
        self.splashAdError(error);
    }
}

@end
