//
//  UIViewController+RSViewController.m
//  测试暗黑和白天模式
//
//  Created by mac on 2022/3/24.
//

#import "UIViewController+RSViewController.h"

@implementation UIViewController (RSViewController)


+(void)popGestureClose:(UIViewController *)vc{
    if([vc.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        for (UIGestureRecognizer * popGesture in vc.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = NO;
        }
        
//        vc.navigationController.interactivePopGestureRecognizer.enabled = NO;
        
    }
}

+(void)popGestureOpen:(UIViewController *)vc{
    if ([vc.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        for (UIGestureRecognizer * popGesture in vc.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = YES;
        }
//        vc.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

@end
