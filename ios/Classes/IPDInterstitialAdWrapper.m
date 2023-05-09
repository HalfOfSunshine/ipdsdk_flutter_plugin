//
//  IPDInterstitialAdWrapper.m
//  IPDSDK_flutter_demo
//
//  Created by Rare on 2021/4/6.
//

#import "IPDInterstitialAdWrapper.h"
#import <IPDSDK/IPDSDK.h>
@interface IPDInterstitialAdWrapper()<IPDInterstitialAdDelegate>
@property (nonatomic,strong)IPDInterstitialAd *interstitialAd;
@end

@implementation IPDInterstitialAdWrapper

-(void)loadInterstitialAdWithAdId:(NSString *)adId{
    self.interstitialAd = [[IPDInterstitialAd alloc]initWithPlacementId:adId];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAd];
}

-(void)showInViewController:(UIViewController *)vc{
    [self.interstitialAd presentAdFromRootViewController:vc];
}




- (void) ipd_interstitialAdDidLoad:(IPDInterstitialAd*) ad{
    if (self.interstitialAdDidLoad) {
        self.interstitialAdDidLoad();
    }
}

- (void) ipd_interstitialAdDidLoadFail:(IPDInterstitialAd*) ad error:(NSError * __nullable)error{
    if (self.interstitialAdError) {
        self.interstitialAdError(error);
    }
}

- (void) ipd_interstitialAdDidPresentScreen:(IPDInterstitialAd*) ad{
    if (self.interstitialAdDidPresentScreen) {
        self.interstitialAdDidPresentScreen();
    }
}

- (void) ipd_interstitialAdDidClick:(IPDInterstitialAd*) ad{
    if (self.interstitialAdDidClick) {
        self.interstitialAdDidClick();
    }
}

- (void) ipd_interstitialAdDidClose:(IPDInterstitialAd*) ad{
    if (self.interstitialAdDidClose) {
        self.interstitialAdDidClose();
    }
}

- (void) ipd_interstitialAdDetailDidClose:(IPDInterstitialAd*) ad{
    if (self.interstitialAdDetailDidClose) {
        self.interstitialAdDetailDidClose();
    }
}

- (void) ipd_interstitialAdDidFail:(IPDInterstitialAd*) ad error:(NSError * __nullable)error{
    if (self.interstitialAdError) {
        self.interstitialAdError(error);
    }
}

@end
