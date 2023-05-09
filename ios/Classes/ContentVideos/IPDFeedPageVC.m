//
//  IPDFeedPageVC.m
//  ipdsdk_flutter
//
//  Created by 麻明康 on 2023/2/17.
//

#import "IPDFeedPageVC.h"
#import <IPDSDK/IPDFeedPage.h>
@interface IPDFeedPageVC ()

@property (nonatomic,strong)IPDFeedPage *contentPage;
@end

@implementation IPDFeedPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频内容瀑布流";
    self.contentPage = [[IPDFeedPage alloc]initWithPlacementId:self.contentId];
    self.contentPage.videoStateDelegate = self;
    self.contentPage.stateDelegate = self;
    UIViewController *vc = self.contentPage.viewController;
    [self tryAddSubVC:vc];
}

@end
