//
//  CDAddAttachmentMenuView.m
//  CDNotepad
//
//  Created by Cindy on 2017/1/10.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDAddAttachmentMenuView.h"


const CGFloat AddAttachmentMenuHeight = 45.0;


@interface CDAddAttachmentMenuView ()

@property (nonatomic,strong) UIView *viewMenu;
@property (nonatomic,strong) UIButton *buttonSelectedPicture;
@property (nonatomic,strong) UIButton *buttonMakeVoice;
@property (nonatomic,strong) UIButton *buttonSelectedDate;

@end


@implementation CDAddAttachmentMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.buttonSelectedPicture.backgroundColor = [UIColor whiteColor];
    self.buttonSelectedPicture.layer.borderColor = DefineColorRGB(190.0, 190.0, 190.0, 0.5).CGColor;
    self.buttonSelectedPicture.layer.borderWidth = 1.0;
    self.buttonSelectedPicture.layer.cornerRadius = 3.0f;
    
    self.buttonMakeVoice.backgroundColor = [UIColor whiteColor];
    self.buttonMakeVoice.layer.borderColor = DefineColorRGB(190.0, 190.0, 190.0, 0.5).CGColor;
    self.buttonMakeVoice.layer.borderWidth = 1.0;
    self.buttonMakeVoice.layer.cornerRadius = 3.0f;
    
    self.buttonSelectedDate.backgroundColor = [UIColor whiteColor];
    self.buttonSelectedDate.layer.borderColor = DefineColorRGB(190.0, 190.0, 190.0, 0.5).CGColor;
    self.buttonSelectedDate.layer.borderWidth = 1.0;
    self.buttonSelectedDate.layer.cornerRadius = 3.0f;
    
    
    
}


#pragma mark - Getter Method
- (UIView *)viewMenu
{
    if (_viewMenu == nil) {
        _viewMenu = [[UIView alloc] init];
        _viewMenu.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_viewMenu];
        [_viewMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@(AddAttachmentMenuHeight));
        }];
        
        
    }
    return _viewMenu;
}

- (UIButton *)buttonSelectedPicture
{
    if (_buttonSelectedPicture == nil) {
        _buttonSelectedPicture = [[UIButton alloc] init];
        [self.viewMenu addSubview:_buttonSelectedPicture];
        [_buttonSelectedPicture mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.viewMenu).offset(CDScreenMarginAtLeftAndRight);
            make.top.equalTo(self.viewMenu).offset(8.0);
            make.bottom.equalTo(self.viewMenu).offset(-8.0);
            make.width.equalTo(@70);
        }];
        
        // title文本
        UILabel *label = [[UILabel alloc] init];
        label.text = @"图片";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = UIFONT_14;
        label.textColor = COLOR_TITLE1;
        [_buttonSelectedPicture addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_buttonSelectedPicture).offset(10.0);
            make.top.equalTo(_buttonSelectedPicture);
            make.bottom.equalTo(_buttonSelectedPicture);
            make.width.equalTo(@([label textRectForBounds:CGRectMake(0, 0, 100.0, SCREEN_HEIGHT) limitedToNumberOfLines:1].size.width + 5.0));
        }];
        
        // icon图标
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = [UIImage imageNamed:@"new_or_edit_menu_item_camera_icon"];
        [_buttonSelectedPicture addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(label.mas_left);
            make.centerY.equalTo(label.mas_centerY);
            make.height.equalTo(@20.0);
            make.width.equalTo(@20.0);
        }];
        
        
    }
    return _buttonSelectedPicture;
}

- (UIButton *)buttonMakeVoice
{
    if (_buttonMakeVoice == nil) {
        _buttonMakeVoice = [[UIButton alloc] init];
        [self.viewMenu addSubview:_buttonMakeVoice];
        [_buttonMakeVoice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.buttonSelectedPicture.mas_right).offset(CDScreenMarginAtLeftAndRight*2);
            make.top.equalTo(self.buttonSelectedPicture);
            make.bottom.equalTo(self.buttonSelectedPicture);
            make.width.equalTo(@70);
        }];
        
        
        // title文本
        UILabel *label = [[UILabel alloc] init];
        label.text = @"录音";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = UIFONT_14;
        label.textColor = COLOR_TITLE1;
        [_buttonMakeVoice addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_buttonMakeVoice).offset(10.0);
            make.top.equalTo(_buttonMakeVoice);
            make.bottom.equalTo(_buttonMakeVoice);
            make.width.equalTo(@([label textRectForBounds:CGRectMake(0, 0, 100.0, SCREEN_HEIGHT) limitedToNumberOfLines:1].size.width + 5.0));
        }];
        
        // icon图标
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = [UIImage imageNamed:@"new_or_edit_menu_item_voice_icon"];
        [_buttonMakeVoice addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(label.mas_left);
            make.centerY.equalTo(label.mas_centerY);
            make.height.equalTo(@20.0);
            make.width.equalTo(@20.0);
        }];
        
    }
    return _buttonMakeVoice;
}

- (UIButton *)buttonSelectedDate
{
    if (_buttonSelectedDate == nil) {
        _buttonSelectedDate = [[UIButton alloc] init];
        [self.viewMenu addSubview:_buttonSelectedDate];
        [_buttonSelectedDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-CDScreenMarginAtLeftAndRight);
            make.top.equalTo(self.buttonSelectedPicture);
            make.bottom.equalTo(self.buttonSelectedPicture);
            make.width.equalTo(@130);
        }];
        
        
        // title文本
        UILabel *label = [[UILabel alloc] init];
        label.text = @"选择日期和时间";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = UIFONT_14;
        label.textColor = COLOR_TITLE1;
        
        [_buttonSelectedDate addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_buttonSelectedDate).offset(10.0);
            make.top.equalTo(_buttonSelectedDate);
            make.bottom.equalTo(_buttonSelectedDate);
            make.width.equalTo(@([label textRectForBounds:CGRectMake(0, 0, 100.0, SCREEN_HEIGHT) limitedToNumberOfLines:1].size.width + 5.0));
        }];
        
        // icon图标
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = [UIImage imageNamed:@"new_or_edit_menu_item_calendar_icon"];
        [_buttonSelectedDate addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(label.mas_left);
            make.centerY.equalTo(label.mas_centerY);
            make.height.equalTo(@20.0);
            make.width.equalTo(@20.0);
        }];
        
        
    }
    return _buttonSelectedDate;
}

@end
