//
//  SDProgressHUD.h
//  SDProgressHUD
//
//  Created by 许树铎 on 16/8/18.
//  Copyright © 2016年 XuShuduo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SDAlert,
    SDProgress
} sdState;

@interface SDProgressHUD : UIView

+ (instancetype)sharedManager;

+ (void)showErrorWithTitle:(NSString *)title Message:(NSString *)message;
+ (void)showSuccessWithTitle:(NSString *)title Message:(NSString *)message;
+ (void)showQuestionWithTitle:(NSString *)title Message:(NSString *)message;
+ (void)showInfoWithTitle:(NSString *)title Message:(NSString *)message;
+ (void)showWarningWithTitle:(NSString *)title Message:(NSString *)message;
+ (void)showProgress:(CGFloat)progress Title:(NSString *)title Message:(NSString *)message;

+ (void)dismiss;
+ (void)dismissWithDelay:(NSTimeInterval)delay;

- (void)showHUDWithImage:(UIImage *)image State:(sdState)state Progress:(CGFloat)progress BackgroundColor:(UIColor *)backgroundColor Title:(NSString *)title Message:(NSString *)message;

@end
