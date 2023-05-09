//
//  IPDContentPagePlatformView.m
//  ipdsdk_flutter
//
//  Created by 麻明康 on 2023/2/17.
//

#import "IPDContentPagePlatformView.h"
#import <IPDSDK/IPDSDK.h>
#import "IPDPlatformTool.h"
@interface IPDContentPagePlatformView()<FlutterStreamHandler, IPDBannerAdViewDelegate>
@property (nonatomic, strong) UIView *containerView;

@property(nonatomic,strong) UIView *ContentPageView;

@property (nonatomic, strong) FlutterResult bannerCallback;

@end

@implementation IPDContentPagePlatformView

@end
