//
//  UIViewController+RSViewController.h
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (RSViewController)
+(void)popGestureClose:(UIViewController *)vc;
+(void)popGestureOpen:(UIViewController *)vc;
@end

NS_ASSUME_NONNULL_END
