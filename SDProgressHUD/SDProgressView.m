//
//  SDProgressView.m
//  SDProgressHUD
//
//  Created by 许树铎 on 16/8/20.
//  Copyright © 2016年 XuShuduo. All rights reserved.
//

#import "SDProgressView.h"

@implementation SDProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (self.showShadow) {
        [[UIColor colorWithWhite:0.5 alpha:1.00] set];
        UIBezierPath * path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5) radius:rect.size.width * 0.5 - 1.5 startAngle:-M_PI_2 endAngle:-M_PI_2 + 1.0 * M_PI * 2 clockwise:YES];
        path1.lineWidth = 2;
        [path1 stroke];
    }
    
    [[UIColor whiteColor] set];
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 1.5;
    CGFloat startA = -M_PI_2;
    CGFloat endA = startA + self.progress * 0.01 * M_PI * 2;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    path.lineWidth = 2;
    path.lineJoinStyle = kCGLineCapRound;
    path.lineCapStyle = kCGLineCapRound;
    [path stroke];
}

@end
