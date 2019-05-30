//
//  SYTJumpTool.m
//  yitongjinrong
//
//  Created by 胡庭 on 2019/3/22.
//  Copyright © 2019年 胡庭. All rights reserved.
//

#import "SYTJumpTool.h"

@implementation SYTJumpTool


#pragma mark --- public

+ (void)pushVC:(UIViewController *)vc from:(id)responder
{
    [self pushVC:vc from:responder animated:YES];
}


+ (void)pushVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    [topVC.navigationController pushViewController:vc animated:animated];
}



+ (void)presentVC:(UIViewController *)vc from:(id)responder
{
    [self presentVC:vc from:responder animated:YES];
}

+ (void)presentVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated
{
    UIViewController *topVC = [self fetchViewController:responder];
    [topVC presentViewController:vc animated:animated completion:nil];
}

+ (UIViewController *)zmkhJumpRooVc:(id)responder
{
    return [self fetchViewController:responder];
}


#pragma mark --- private

+ (UIViewController *)fetchViewController:(id)responder
{
    UIViewController *vc;
    if ([responder isKindOfClass:[UIView class]]) {
        vc = [self fetchViewControllerFromView:responder];
    }else if ([responder isKindOfClass:[UIViewController class]]){
        vc = responder;
    }
    if (!vc) {
        vc = [self fetchViewControllerFromRootViewController];
    }
    return vc;
}

+ (UIViewController *)fetchViewControllerFromView:(UIView *)view
{
    UIResponder *responder = view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            break;
        }
        responder = responder.nextResponder;
    }
    return (UIViewController *)responder;
}

+ (UIViewController *)fetchViewControllerFromRootViewController
{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (vc) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = [(UITabBarController *)vc selectedViewController];
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)vc visibleViewController];
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}


@end
