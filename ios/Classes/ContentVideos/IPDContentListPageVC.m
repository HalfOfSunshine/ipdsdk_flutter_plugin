//
//  IPDContentListPageVC.m
//  ipdsdk_flutter
//
//  Created by 麻明康 on 2023/2/16.
//

#import "IPDContentListPageVC.h"
#import <IPDSDK/IPDContentPage.h>
@interface IPDContentListPageVC ()

@property (nonatomic,strong)IPDContentPage *contentPage;
@end

@implementation IPDContentListPageVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"视频内容列表";
    self.contentPage = [[IPDContentPage alloc]initWithPlacementId:self.contentId];
    self.contentPage.videoStateDelegate = self;
    self.contentPage.stateDelegate = self;
    UIViewController *vc = self.contentPage.viewController;
    [self tryAddSubVC:vc];
}


@end
