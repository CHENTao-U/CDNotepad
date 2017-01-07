//
//  CDHomeViewController.m
//  CDNotepad
//
//  Created by Cindy on 2017/1/7.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDHomeViewController.h"

@interface CDHomeViewController ()

@property (nonatomic,strong) UIButton *buttonTitle;

@end

@implementation CDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initButtonItem];
}

- (void)initTitleView
{
    UIButton *button = [[UIButton alloc] init];
    [button ]
}

- (void)initButtonItem
{
    UIButton *rightButtonOne = [[UIButton alloc] init];
    [rightButtonOne setImage:[UIImage imageNamed:@"home_navigation_left_calendar_icon"] forState:UIControlStateNormal];
    [rightButtonOne setTintColor:[UIColor whiteColor]];
    rightButtonOne.cd_size = CGSizeMake(28, 28);
    rightButtonOne.tag = 1;
    // 监听按钮点击
    [rightButtonOne addTarget:self action:@selector(rightButtonPressEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    UIButton *rightButtonTwo = [[UIButton alloc] init];
    [rightButtonTwo setImage:[UIImage imageNamed:@"home_navigation_left_calendar_icon"] forState:UIControlStateNormal];
    [rightButtonTwo setTintColor:[UIColor whiteColor]];
    rightButtonTwo.cd_size = CGSizeMake(28, 28);
    rightButtonTwo.tag = 2;
    // 监听按钮点击
    [rightButtonTwo addTarget:self action:@selector(rightButtonPressEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:rightButtonTwo],[[UIBarButtonItem alloc] initWithCustomView:rightButtonOne]];
}


#pragma mark - IBAction Method
- (void)rightButtonPressEvent:(UIButton *)button
{
    
}

#pragma mark - Getter Method
- (UIButton *)buttonTitle
{
    if (_buttonTitle == nil) {
        _buttonTitle = [[UIButton alloc] init];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = [UIImage imageNamed:@"home_navigation_left_calendar_icon"];
        [_buttonTitle addSubview:imageView];
//        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo()
//        }]
        
        
    }
}


@end
