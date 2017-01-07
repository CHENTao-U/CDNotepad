//
//  CDNavigationController.m
//  CDNotepad
//
//  Created by Cindy on 2017/1/7.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDNavigationController.h"

@interface CDNavigationController ()

@end

@implementation CDNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /**
     * 去掉导航栏原生的底部黑线
     */
    [[self navigationBar] setShadowImage:[[UIImage alloc] init]];
    //  背景拉伸
    UIImage *imageBg = [UIImage imageNamed:@"navigation_bg_color"];
    CGFloat top = 10; // 顶端盖高度
    CGFloat bottom = 10 ; // 底端盖高度
    CGFloat left = 10; // 左端盖宽度
    CGFloat right = 10; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    [[self navigationBar] setBackgroundImage:[imageBg resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile] forBarMetrics:UIBarMetricsDefault];
    //    [[self navigationBar] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    
    /**
     *  为导航栏添加底部阴影
     */
    [self navigationBar].layer.shadowColor = DefineColorRGB(190.0, 190.0, 190.0, 1.0).CGColor; //shadowColor阴影颜色
    [self navigationBar].layer.shadowOffset = CGSizeMake(0.0f , 1.0f); //shadowOffset阴影偏移x，y向(上/下)偏移(-/+)2
    [self navigationBar].layer.shadowOpacity = 0.6f;//阴影透明度，默认0
    [self navigationBar].layer.shadowRadius = 1.0f;//阴影半径
    
    
//    self.delegate = self;
    //  设置导航手势不可用
//    self.interactivePopGestureRecognizer.enabled = NO;
}









@end
