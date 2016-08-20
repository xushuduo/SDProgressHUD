//
//  SDProgressHUD.m
//  SDProgressHUD
//
//  Created by 许树铎 on 16/8/18.
//  Copyright © 2016年 XuShuduo. All rights reserved.
//

#import "SDProgressHUD.h"
#import "SDProgressView.h"

#define errorIcon @"iVBORw0KGgoAAAANSUhEUgAAAFoAAABaBAMAAADKhlwxAAAAJ1BMVEUAAAD///////////////////////////////////////////////+uPUo5AAAADHRSTlMAuiGNkX6vnhNhWU3EnBZSAAABGUlEQVRYw+zWvQ3CMBCG4SgI8VOCROUibACbsAIbMAIjMAKruL+hiJTiU+6M3uKULld+sR5Fie27bq21lqzh34O+kd0v7/bi/fMcsk2xU3v11eot0GZ1aL5HMfP4YcyEz+nR+cyznZlwT5u95uG2mHBPW324tAiPdI2GcI574ZhKgTAyTMuBKEJMSwI6UkzLAjpiTEsDOuJMy/M04kxLdDThjgZcNOFTiWZcNOOiGfc046IZF811nFZ/u7zN78004/y9+V8yzTjvQd7fibPD5zJ15vk+YZpxvgf5jkUacOgNib6DPS3RL7kXJ/o8zxCJ+QRnn8RcRTPbbxvQBB3xtQdF0AVZ8LU1HTAEHXG3Y0VJayOPglEwWAAAXcPD9MDPRsYAAAAASUVORK5CYII="

#define successIcon @"iVBORw0KGgoAAAANSUhEUgAAAFoAAABaBAMAAADKhlwxAAAALVBMVEUAAAD///////////////////////////////////////////////////////+hSKubAAAADnRSTlMAmI1MLmxYIRMIgX56FyrN+xIAAADPSURBVFjD7dG9DcJAEERhY/5EaCwBIjhBB5AQuwTohBKgA1qhH5JrYGpAInnhziUO0L149AW7Ta32py2HkvW7e/jjNmnnr49SLqGVhwJa+V5Aa19EH0rodaUrXenx6MurgH6m3qdXSflk062kPqBpIv3wgGYNHt56lsCNW5/BjTdOwQk6xqEtHDrGoS0cOsahLRw6xqEtHDrGoS0cOsahLRw6xqEtHNrAN9AGLkEbOHSIQ9s4dIxDxzi00SJJubG7SVt/PU/d0Ph9rk2tNmpfUjIrWec7fz8AAAAASUVORK5CYII="

#define infoIcon @"iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAMAAAAPdrEwAAAAPFBMVEUAAAD////////////////////////////////////////////////////////////////////////////YSWgTAAAAE3RSTlMAh264o6hyW05AKhuJegWzl2UNOE5tlAAAAIpJREFUWMPt0ksOAiEQRdFqn4DQHz/sf692FGXqoBh0vHcBJ5XKM6IDtN2XKc42oKS6p9VfzqqvFN3pUFtyp/Wl8zC6Xrzpa6cPdHX/tfu0l48dzD29bRXz76YdDrONaCvlYUT0U/ncSu50rK3JnT5BQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDWy+ptRr9U0+MVSiB4HHeewAAAABJRU5ErkJggg=="

#define warningIcon @"iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAMAAAAPdrEwAAAARVBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////9SnXPCAAAAFnRSTlMAqU0Qch6VooKdNW2NYVFAGwaZkX5GzcdEcAAAAL5JREFUWMPt1FkOwyAMhGE7EMi+dOH+R63UAL3AOFWU+Q/wyS8eYezOjT43wmlNOV3M6NSQJk2aNGnSpEmfSsdKOzQdTqAVTk+F7gXdWOgIp70dPRe6g9PDNWnN9CLwCt1ckm7xdMi0M6PVjo6Cz9d1wtPmVz8F3/ugX4JvKBOCbz1oL/h2LX+Oz5xexaD4pXcxKNQJMaLFos5mQuqnR7FofoQQJmHs5La2toFpTTV1ZnQiTZr0P+lefzlhDNAHHJExPphheSAAAAAASUVORK5CYII="

#define questionIcon @"iVBORw0KGgoAAAANSUhEUgAAAFoAAABaBAMAAADKhlwxAAAAFVBMVEUAAAD///////////////////////9Iz20EAAAABnRSTlMAjnE5HFVlP+iiAAABHElEQVRYw+2Vvw6DIBCHpdad89+MadK5pi/g0t2pOx14/0eoEBsF0zuuiTFp+DbD5/EDOcwSO/AAyyXKzaE1Fg2KlgswH0BS8hnMAlm9M2sAl0Xr2bpCbTA++kaXBotxSDI1jG5vyOStE4Z534koLohWyxMapbfDjb/kBg2ix2Cqr9/RjpbZAmqLMGfn5kJsPSKve/TexJR9ncZe2YoTYrtF1d5Zb1E7HDvSVrF2vrHPiH2CCc8uzGLTCL6tUCU8VQOqECcWb7wm1u7JRW4bjxMEYksDJ4gIg9ClS1ZptV9pySkNx6fOWaWFS81qA7lLGxTWrnbqdeTXh1/7NE937XO2pGbZMtke94kxS/yMAMvAaTST7L+w5y+fiOEN0J6om8ufMnAAAAAASUVORK5CYII="

#define errorColor [UIColor colorWithRed:0.95 green:0.45 blue:0.45 alpha:0.95]

#define successColor [UIColor colorWithRed:0.65 green:0.86 blue:0.53 alpha:0.95]

#define infoColor [UIColor colorWithRed:0.25 green:0.76 blue:0.93 alpha:0.95]

#define warningColor [UIColor colorWithRed:0.97 green:0.73 blue:0.53 alpha:0.95]

#define questionColor [UIColor colorWithRed:0.79 green:0.85 blue:0.88 alpha:0.95]

// 屏幕宽度
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

// 屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// 默认标题字号
static const CGFloat defaultTitleFontSize = 12.0;

// 默认信息字号
static const CGFloat defaultMessageFontSize = 10.0;

// 图片的宽高
static const CGFloat imageViewWidthHeight = 44.0;

// 内容距离顶部(底部)间距
static const CGFloat viewTopBottomMargin = 10.0;

// 内容距离左边(右边)间距
static const CGFloat viewLeftRightMargin = 15.0;

// 图片与文字间距
static const CGFloat imageTextMargin = 10.0;

// title和message的间距
static const CGFloat titleMessageMargin = 5.0;

@interface SDProgressHUD ()

@property (nonatomic, strong) UIWindow *sdWindow;

@property (nonatomic, assign) CGFloat titleFontSize;

@property (nonatomic, assign) CGFloat messageFontSize;

@property (nonatomic, weak) UIView *contentView;

@property (nonatomic, weak) SDProgressView *imageView;

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *progressLabel;

@property (nonatomic, weak) UIView *textView;

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UILabel *messageLabel;

@end

@implementation SDProgressHUD

/**
 *  创建单例对象
 */
+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

/**
 *  重写init方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWindow];
        [self setupView];
        // 默认参数
        _titleFontSize = defaultTitleFontSize;
        _messageFontSize = defaultMessageFontSize;
        
    }
    return self;
}

/**
 *  初始化sdWindow
 */
- (void)setupWindow {
    UIWindow *sdWindow = [[UIWindow alloc] init];
    sdWindow.backgroundColor = [UIColor clearColor];
    sdWindow.windowLevel = UIWindowLevelAlert;
    self.sdWindow = sdWindow;
}

/**
 *  初始化控件
 */
- (void)setupView {
    // contentView
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    self.contentView = contentView;
    
    // imageView
    SDProgressView *imageView = [[SDProgressView alloc] init];
    imageView.frame = CGRectMake(0, 0, imageViewWidthHeight, imageViewWidthHeight);
    [contentView addSubview:imageView];
    self.imageView = imageView;
    
    // iconView
    UIImageView *iconView = [[UIImageView alloc] init];
    CGFloat iconViewWH = imageViewWidthHeight * 0.65;
    CGFloat iconViewXY = (imageViewWidthHeight - iconViewWH) * 0.5;
    iconView.frame = CGRectMake(iconViewXY, iconViewXY, iconViewWH, iconViewWH);
    [imageView addSubview:iconView];
    self.iconView = iconView;
    
    // progressLabel
    UILabel *progressLabel = [[UILabel alloc] init];
    progressLabel.textColor = [UIColor whiteColor];
    progressLabel.font = [UIFont systemFontOfSize:12];
    [imageView addSubview:progressLabel];
    self.progressLabel = progressLabel;
    
    // textView
    UIView *textView = [[UIView alloc] init];
    [contentView addSubview:textView];
    self.textView = textView;
    
    // titleLabel
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFont:[UIFont systemFontOfSize:defaultTitleFontSize]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setNumberOfLines:0];
    [textView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    // messageLabel
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.font = [UIFont systemFontOfSize:defaultMessageFontSize];
    [messageLabel setTextColor:[UIColor whiteColor]];
    [messageLabel setNumberOfLines:0];
    [textView addSubview:messageLabel];
    self.messageLabel = messageLabel;
    
}

+ (void)showErrorWithTitle:(NSString *)title Message:(NSString *)message {
    [[self sharedManager] showHUDWithImage:[self getBase64Image:errorIcon] State:SDAlert Progress:0 BackgroundColor:errorColor Title:title Message:message];
}

+ (void)showSuccessWithTitle:(NSString *)title Message:(NSString *)message {
    [[self sharedManager] showHUDWithImage:[self getBase64Image:successIcon] State:SDAlert Progress:0 BackgroundColor:successColor Title:title Message:message];
}

+ (void)showQuestionWithTitle:(NSString *)title Message:(NSString *)message {
    [[self sharedManager] showHUDWithImage:[self getBase64Image:questionIcon] State:SDAlert Progress:0 BackgroundColor:questionColor Title:title Message:message];
}

+ (void)showInfoWithTitle:(NSString *)title Message:(NSString *)message {
    [[self sharedManager] showHUDWithImage:[self getBase64Image:infoIcon] State:SDAlert Progress:0 BackgroundColor:infoColor Title:title Message:message];
}

+ (void)showWarningWithTitle:(NSString *)title Message:(NSString *)message {
    [[self sharedManager] showHUDWithImage:[self getBase64Image:warningIcon] State:SDAlert Progress:0 BackgroundColor:warningColor Title:title Message:message];
}

+ (void)showProgress:(CGFloat)progress Title:(NSString *)title Message:(NSString *)message {
    [[self sharedManager] showHUDWithImage:nil State:SDProgress Progress:progress BackgroundColor:[UIColor colorWithWhite:0 alpha:0.925] Title:title Message:message];
}

- (void)showHUDWithImage:(UIImage *)image State:(sdState)state Progress:(CGFloat)progress BackgroundColor:(UIColor *)backgroundColor Title:(NSString *)title Message:(NSString *)message {
    
    // Setting
    self.iconView.image = image;
    self.backgroundColor = backgroundColor;
    self.titleLabel.text = title;
    self.messageLabel.text = message;
    if (state == SDProgress) {
        self.imageView.showShadow = YES;
        self.progressLabel.text = [NSString stringWithFormat:@"%zd%%", (int)(progress * 100.0)];
        self.imageView.progress = (int)(progress * 100.0);
    } else {
        self.imageView.showShadow = NO;
        self.progressLabel.text = @"";
        self.imageView.progress = 0;
    }
    
    // Layout
    [self layoutSubviews];
    
    // Animation
    if ((state == SDProgress && self.sdWindow.hidden == YES) || state == SDAlert) {
        self.iconView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
        [UIView animateWithDuration:0.25 animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (state == SDAlert) {
                [self startAnimation];
                [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.25 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.iconView.transform = CGAffineTransformIdentity;
                } completion:nil];
            }
        }];
    }
    
    // Show
    [self.sdWindow setHidden:NO];
    [self.sdWindow addSubview:self];
}

- (void)startAnimation {
    self.imageView.progress += 5;
    if (self.imageView.progress < 100) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimation];
        });
    }
}

- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
        [self.sdWindow setHidden:YES];
    }];
}

+ (void)dismiss {
    [[self sharedManager] dismiss];
}

+ (void)dismissWithDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[self sharedManager] dismiss];
    });
}

+ (UIImage *)getBase64Image:(NSString *)base64Code {
    NSData *decodedImageData = [[NSData alloc] initWithBase64EncodedString:base64Code options:NSUTF8StringEncoding];
    return [UIImage imageWithData:decodedImageData];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIFont *titleFont = [UIFont systemFontOfSize:defaultTitleFontSize];
    UIFont *messageFont = [UIFont systemFontOfSize:defaultMessageFontSize];
    CGFloat contentViewWidth = SCREEN_WIDTH - 2 * viewLeftRightMargin;
    CGFloat textViewWidth = contentViewWidth - imageViewWidthHeight - imageTextMargin;
    CGSize titleTextSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(textViewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : titleFont} context:nil].size;
    CGSize messageTextSize = [self.messageLabel.text boundingRectWithSize:CGSizeMake(textViewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : messageFont} context:nil].size;
    CGFloat contentViewHeight = titleTextSize.height + messageTextSize.height + titleMessageMargin;
    CGFloat selfHeight = contentViewHeight + 2 * viewTopBottomMargin;
    selfHeight = selfHeight < 64.0 ? 64.0 : selfHeight;
    
    [self.progressLabel sizeToFit];
    self.progressLabel.center = self.imageView.center;
    self.textView.frame = CGRectMake(imageViewWidthHeight + imageTextMargin, 0, textViewWidth, contentViewHeight);
    self.titleLabel.frame = CGRectMake(0, 0, titleTextSize.width, titleTextSize.height);
    self.messageLabel.frame = CGRectMake(0, titleTextSize.height + titleMessageMargin, messageTextSize.width, messageTextSize.height);
    self.contentView.frame = CGRectMake(viewLeftRightMargin, viewTopBottomMargin, contentViewWidth, contentViewHeight);
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, selfHeight);
    self.sdWindow.frame = self.bounds;
}

@end
