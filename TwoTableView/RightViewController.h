//
//  RightViewController.h
//  TwoTableView
//
//  Created by fengbai on 16/7/22.
//  Copyright © 2016年 fengbai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RightViewController;

@protocol RightViewControllerDelegate <NSObject>

- (void)willDisplayHeaderView:(NSInteger)section;
- (void)didEndDisplayHeaderView:(NSInteger)section;

@end

@interface RightViewController : UIViewController

@property (nonatomic, weak) id<RightViewControllerDelegate> delegate;
- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath;

@end
