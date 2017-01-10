//
//  CDInputCollectionCell.m
//  CDNotepad
//
//  Created by Cindy on 2017/1/10.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDInputCollectionCell.h"

@interface CDInputCollectionCell () <UITextViewDelegate>
{
    UILabel *_labelTextViewPlaceholder;
}
@property (nonatomic,strong) UITextView *textViewInputContent;
@end


@implementation CDInputCollectionCell

- (void)setup
{
    [self setContentText:@""];
}

- (void)setContentText:(NSString *)content
{
    self.textViewInputContent.text = content.length > 0 ? content : @"";
    
}

#pragma mark 
- (void)textViewDidChange:(UITextView *)textView
{
    _labelTextViewPlaceholder.hidden = (self.textViewInputContent.text.length > 0) ? YES : NO;
}

#pragma mark - Getter Method
- (UITextView *)textViewInputContent
{
    if (_textViewInputContent == nil) {
        _textViewInputContent = [[UITextView alloc] init];

        _textViewInputContent.textColor = COLOR_TITLE1;
        _textViewInputContent.font = UIFONT_14;
//        _textViewInputContent.layer.cornerRadius = 3.0f;
//        _textViewInputContent.layer.borderColor = CommonBordorColor.CGColor;
//        _textViewInputContent.layer.borderWidth = CommonLineBorderWidth;
        _textViewInputContent.delegate = self;
        [self addSubview:_textViewInputContent];
        [_textViewInputContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        
        
        [_labelTextViewPlaceholder removeFromSuperview];
        _labelTextViewPlaceholder = [[UILabel alloc] init];
        _labelTextViewPlaceholder.text  = @"最多输入500个字符";
        _labelTextViewPlaceholder.textColor = [UIColor lightGrayColor];
        _labelTextViewPlaceholder.font = UIFONT_14;
        _labelTextViewPlaceholder.numberOfLines = 0;
        _labelTextViewPlaceholder.textAlignment = NSTextAlignmentLeft;
        [_textViewInputContent addSubview:_labelTextViewPlaceholder];
        [_labelTextViewPlaceholder mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_textViewInputContent).offset(5.0);
            make.centerX.equalTo(_textViewInputContent);
            make.width.equalTo(@(SCREEN_WIDTH - (5.0+10.0)*2));
        }];
        
    }
    return _textViewInputContent;
}

@end
