//
//  IPDRewardVideoAdWrapper.m
//  IPDSDK_flutter_demo
//
//  Created by Rare on 2021/3/26.
//

#import "IPDRewardVideoAdWrapper.h"
#import <IPDSDK/IPDSDK.h>
@interface IPDRewardVideoAdWrapper()<IPDRewardVideoAdDelegate>

@property (nonatomic,strong)IPDRewardVideoAd *rewardVideoAd;

@end

@implementation IPDRewardVideoAdWrapper
-(void)loadRewardVideoAdWithAdId:(NSString *)adId userId:(NSString *)userId{
    self.rewardVideoAd = [[IPDRewardVideoAd alloc]initWithPlacementId:adId userId:userId];
    self.rewardVideoAd.delegate = self;
    [self.rewardVideoAd loadAd];
}

-(void)showRewardVideoAdWithViewController:(UIViewController *)vc{
    [self.rewardVideoAd showAdInViewController:vc];
}
/**
广告数据加载成功回调

@param rewardedVideoAd IPDRewardVideoAd 实例
*/
- (void)ipd_rewardVideoAdDidLoad:(IPDRewardVideoAd *)rewardedVideoAd{
    
}
/**
视频数据下载成功回调，已经下载过的视频会直接回调

@param rewardedVideoAd IPDRewardVideoAd 实例
*/
- (void)ipd_rewardVideoAdVideoDidLoad:(IPDRewardVideoAd *)rewardedVideoAd{
    if (self.rewardVideoLoadSuccess) {
        self.rewardVideoLoadSuccess();
    }
}

/**
 视频广告展示

 @param rewardedVideoAd IPDRewardVideoAd 实例
 */
- (void)ipd_rewardVideoAdDidShow:(IPDRewardVideoAd *)rewardedVideoAd{
    if (self.rewardVideoAdDidShow) {
        self.rewardVideoAdDidShow();
    }
}

/**
 视频播放页关闭

 @param rewardedVideoAd IPDRewardVideoAd 实例
 */
- (void)ipd_rewardVideoAdDidClose:(IPDRewardVideoAd *)rewardedVideoAd{
    if (self.rewardVideoAdDidClose) {
        self.rewardVideoAdDidClose();
    }
}

/**
 视频广告信息点击

 @param rewardedVideoAd IPDRewardVideoAd 实例
 */
- (void)ipd_rewardVideoAdDidClicked:(IPDRewardVideoAd *)rewardedVideoAd{
    if (self.rewardVideoAdDidClicked) {
        self.rewardVideoAdDidClicked();
    }
}


//奖励触发
- (void)ipd_rewardVideoAdDidRewardEffective:(IPDRewardVideoAd *)rewardedVideoAd{
    if (self.rewardVideoDidRewardEffective) {
        self.rewardVideoDidRewardEffective(rewardedVideoAd.trade_id,rewardedVideoAd.validationDictionary);
    }
}
/**
 视频广告视频播放完成

 @param rewardedVideoAd IPDRewardVideoAd 实例
 */
- (void)ipd_rewardVideoAdDidPlayFinish:(IPDRewardVideoAd *)rewardedVideoAd{
    if (self.rewardVideoAdDidPlayFinish) {
        self.rewardVideoAdDidPlayFinish();
    }
}


/**
 视频广告各种错误信息回调

 @param rewardedVideoAd IPDRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)ipd_rewardVideoAd:(IPDRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error{
    if (self.rewardVideoAdError) {
        self.rewardVideoAdError(error);
    }
}
@end
