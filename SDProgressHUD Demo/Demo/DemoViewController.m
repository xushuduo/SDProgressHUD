//
//  DemoViewController.m
//  SDProgressHUD Demo
//
//  Created by 许树铎 on 16/8/20.
//  Copyright © 2016年 XuShuduo. All rights reserved.
//

#import "DemoViewController.h"
#import "SDProgressHUD.h"

@interface DemoViewController ()

@property (nonatomic, strong) NSArray *btnArray;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SDProgressHUD Demo";
    self.view.backgroundColor = [UIColor colorWithWhite:0.96 alpha:1];
    [self setupButton];
    [self.view addSubview:[UISwitch new]];
}

- (void)setupButton {
    NSMutableArray *btnArray = [NSMutableArray array];
    
    [btnArray addObject:[self btnTitle:@"Show Success" ClickBlock:^{
        [SDProgressHUD showSuccessWithTitle:@"成功提示" Message:@"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据"];
    }]];
    
    [btnArray addObject:[self btnTitle:@"Show Error" ClickBlock:^{
        [SDProgressHUD showErrorWithTitle:@"错误提示" Message:@"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据"];
    }]];
    
    [btnArray addObject:[self btnTitle:@"Show Info" ClickBlock:^{
        [SDProgressHUD showInfoWithTitle:@"信息提示\n测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据" Message:nil];
    }]];
    
    [btnArray addObject:[self btnTitle:@"Show Waring" ClickBlock:^{
        [SDProgressHUD showWarningWithTitle:@"警告提示" Message:@"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据"];
    }]];
    
    [btnArray addObject:[self btnTitle:@"Show Question" ClickBlock:^{
        [SDProgressHUD showQuestionWithTitle:@"问题提示" Message:@"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据"];
    }]];
    
    [btnArray addObject:[self btnTitle:@"Show Progress" ClickBlock:^{
        [self progress:0];
    }]];
    
    [btnArray addObject:[self btnTitle:@"Auto Dismiss" ClickBlock:^{
        [SDProgressHUD showInfoWithTitle:@"展示提示" Message:@"3秒后自动消失！3秒后自动消失！3秒后自动消失！3秒后自动消失！3秒后自动消失！3秒后自动消失！3秒后自动消失！"];
        [SDProgressHUD dismissWithDelay:3.0];
    }]];
    
    [btnArray addObject:[self btnTitle:@"Dismiss" ClickBlock:^{
        [SDProgressHUD dismiss];
    }]];
    
    self.btnArray = [btnArray copy];
    
    CGFloat btnW = 200;
    CGFloat btnH = 35;
    CGFloat btnM = 20;
    CGFloat btnX = (self.view.bounds.size.width - btnW) * 0.5;
    NSInteger i = 0;
    for (NSDictionary *dict in btnArray) {
        CGFloat btnY = i * btnH + i * btnM + 100;
        UIButton *btn = [UIButton buttonWithType:0];
        [btn setTitle:dict[@"title"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = 250 + i++;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth = 1;
        [self.view addSubview:btn];
    }
}

- (NSDictionary *)btnTitle:(NSString *)title ClickBlock:(void(^)())click {
    return @{@"title":title, @"click":click};
}

- (void)btnClick:(UIButton *)btn {
    NSDictionary *dict = self.btnArray[btn.tag - 250];
    void(^block)() = dict[@"click"];
    block();
}

- (void)progress:(NSInteger)i {
    if (i == 100) {
        return;
    }
    i++;
    [SDProgressHUD showProgress:i * 0.01 Title:@"进度测试" Message:[NSString stringWithFormat:@"现在是%zd%%", i]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(arc4random() % 8 * 0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self progress:i];
    });
}

@end
