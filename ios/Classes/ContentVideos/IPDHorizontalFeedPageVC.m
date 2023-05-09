//
//  IPDHorizontalFeedPageVC.m
//  IPDSDKDemo
//
//  Created by 麻明康 on 2023/1/5.
//  Copyright © 2023 ipd. All rights reserved.
//

#import "IPDHorizontalFeedPageVC.h"
#import <IPDSDK/IPDHorizontalFeedPage.h>
#import <IPDSDK/IPDContentPageStateDelegate.h>
@interface IPDHorizontalFeedPageVC ()<IPDContentPageHorizontalFeedCallBackDelegate>
@property (nonatomic,strong)IPDHorizontalFeedPage *contentPage;

@end

@implementation IPDHorizontalFeedPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频内容横版";
    self.contentPage = [[IPDHorizontalFeedPage alloc]initWithPlacementId:self.contentId];
    self.contentPage.callBackDelegate = self;
    UIViewController *vc = self.contentPage.viewController;
    [self tryAddSubVC:vc];
}


#pragma mark =============== IPDContentPageHorizontalFeedCallBackDelegate ===============

/// 进入横版视频详情页
/// @param viewController 详情页VC
/// @param content 视频信息
- (void)ipd_horizontalFeedDetailDidEnter:(UIViewController *)viewController contentInfo:(id<IPDContentInfo>)content{
    if (self.horizontalFeedDetailDidEnter) self.horizontalFeedDetailDidEnter();
}
/// 离开横版视频详情页
/// @param viewController 详情页VC
- (void)ipd_horizontalFeedDetailDidLeave:(UIViewController *)viewController{
    if (self.horizontalFeedDetailDidLeave) self.horizontalFeedDetailDidLeave();
}

/// 视频详情页appear
/// @param viewController 详情页VC
- (void)ipd_horizontalFeedDetailDidAppear:(UIViewController *)viewController{
    if (self.horizontalFeedDetailDidAppear) self.horizontalFeedDetailDidAppear();
}

/// 详情页disappear
/// @param viewController 详情页VC
- (void)ipd_horizontalFeedDetailDidDisappear:(UIViewController *)viewController{
    if (self.horizontalFeedDetailDidDisappear) self.horizontalFeedDetailDidDisappear();
}

@end
