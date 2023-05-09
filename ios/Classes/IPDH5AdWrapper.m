//
//  IPDH5AdWrapper.m
//  IPDSDK_flutter_demo
//
//  Created by Rare on 2021/9/1.
//

#import "IPDH5AdWrapper.h"
@interface IPDH5AdWrapper()<IPDH5PageDelegate>

@property (nonatomic,strong)IPDH5Page *h5page;
@end

@implementation IPDH5AdWrapper

-(void)loadAdWithAdId:(NSString *)adId user:(IPDUser *)user{
    self.h5page = [[IPDH5Page alloc]initWithPlacementId:adId user:user delegate:self];
    [self.h5page loadH5Page];
}
-(void)showAdWithViewController:(UIViewController *)vc{
    [self.h5page presentH5FromRootViewController:vc animated:NO];
}

//H5Ad加载完成
-(void) onIpdH5PageLoaded:(IPDUser*) user error:(nullable NSError*) error{
    if (error) {
        if (self.onAdError) {
            self.onAdError(error);
        }
    }else{
        if (self.onAdDidLoad) {
            self.onAdDidLoad();
        }
    }
}

//H5Ad错误
-(void) onIpdH5PageError:(IPDUser*) user error:(NSError*) error{
    if (self.onAdError) {
        self.onAdError(error);
    }
}


//H5操作回调
//积分不足
-(void) onIntegralNotEnough:(IPDUser*) user needIntegral:(NSInteger) integral{
    
}
//积分消耗
-(void) onIntegralExpend:(IPDUser*) user expendIntegral:(NSInteger) integral{
    
}

//积分奖励
-(void) onIntegralReward:(IPDUser*) user rewardIntegral:(NSInteger) integral{
    
}

//奖励发放,奖励积分
-(void) onIpdH5PageAdRewardProvide:(IPDUser*) user rewardIntegral:(NSInteger) integral{
    
}

//用户页面的行为操作
-(void) onIpdH5PageUserBehavior:(IPDUser*) user behavior:(NSString*) behavior{
    
}


//广告回调
//广告激励视频加载成功
-(void) onIpdH5PageAdRewardLoaded:(IPDUser*) user trans_id:(NSString*) trans_id{
    if (self.onRewardAdDidLoad) {
        self.onRewardAdDidLoad();
    }
}

//广告激励视频触发激励（观看视频大于一定时长或者视频播放完毕）
-(void) onIpdH5PageAdRewardValid:(IPDUser*) user trans_id:(NSString*) trans_id{
    if (self.onRewardAdRewardEffective) {
        self.onRewardAdRewardEffective(trans_id);
    }
}

//广告点击
-(void) onIpdH5PageAdRewardClick:(IPDUser*) user {
    if (self.onRewardAdDidClick) {
        self.onRewardAdDidClick();
    }
}

//广告加载错误
-(void) onIpdH5PageAdReward:(IPDUser*) user didFailWithError:(NSError*) error{
    if (self.onRewardAdDidError) {
        self.onRewardAdDidError(error);
    }
}

@end
