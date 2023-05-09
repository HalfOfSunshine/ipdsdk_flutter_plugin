//
//  IPDHorizontalFeedPageVC.h
//  ipdsdk_flutter
//
//  Created by 麻明康 on 2023/2/17.
//

#import "IPDContentPageVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface IPDHorizontalFeedPageVC : IPDContentPageVC
@property (nonatomic,copy)void(^horizontalFeedDetailDidEnter)(void);
@property (nonatomic,copy)void(^horizontalFeedDetailDidLeave)(void);
@property (nonatomic,copy)void(^horizontalFeedDetailDidAppear)(void);
@property (nonatomic,copy)void(^horizontalFeedDetailDidDisappear)(void);

@end

NS_ASSUME_NONNULL_END
