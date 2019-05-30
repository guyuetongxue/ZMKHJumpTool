//
//  SYTJumpTool.h
//  yitongjinrong
//
//  Created by 胡庭 on 2019/3/22.
//  Copyright © 2019年 胡庭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYTJumpTool : NSObject

/**
 Push a viewController.
 
 @param vc a viewController.
 @param responder a view or viewController.
 */
+ (void)pushVC:(UIViewController *)vc from:(id)responder;
+ (void)pushVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated;



/**
 Present a viewController.
 
 @param vc a viewController.
 @param responder a view or viewController.
 */
+ (void)presentVC:(UIViewController *)vc from:(id)responder;
+ (void)presentVC:(UIViewController *)vc from:(id)responder animated:(BOOL)animated;




+ (UIViewController *)zmkhJumpRooVc:(id)responder;



@end

NS_ASSUME_NONNULL_END
