//
//  CDHomeViewController.m
//  CDNotepad
//
//  Created by Cindy on 2017/1/7.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDHomeViewController.h"
#import "CDFilterSelectView.h"
#import "CDNoteItemCell.h"

@interface CDHomeViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIButton *buttonTitle;
@property (nonatomic,strong) CDFilterSelectView *filterView;

@property (nonatomic,strong) UITableView *tableViewNotes;

@end

@implementation CDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initButtonItem];
    [self initTitleView];
    
    
    self.tableViewNotes.delegate = self;
    self.tableViewNotes.dataSource = self;
    
}

- (void)initTitleView
{
    [self.buttonTitle addTarget:self action:@selector(navigationButtonPressEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside]; // 监听按钮点击
    self.buttonTitle.tag = 0;
    UILabel *title = [self.buttonTitle viewWithTag:100];
    title.text = @"全部";
    CGSize textSize = [title textRectForBounds:CGRectMake(0, 0, SCREEN_WIDTH - 200.0, 64.0) limitedToNumberOfLines:1].size;
    [title mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_buttonTitle).offset(10.0);
        make.width.equalTo(@(textSize.width + 5.0));
    }];
    self.buttonTitle.cd_size = CGSizeMake(textSize.width + 10*2.0 + 15.0, 44.0);
    self.navigationItem.titleView = self.buttonTitle;
}

- (void)initButtonItem
{
    UIButton *rightButtonOne = [[UIButton alloc] init];
    rightButtonOne.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightButtonOne setImage:[UIImage imageNamed:@"home_navigation_search_icon"] forState:UIControlStateNormal];
    [rightButtonOne setTintColor:[UIColor whiteColor]];
    rightButtonOne.cd_size = CGSizeMake(30.0, 20.0);
    rightButtonOne.tag = 2;
    [rightButtonOne addTarget:self action:@selector(navigationButtonPressEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];// 监听按钮点击
    
    UIButton *rightButtonTwo = [[UIButton alloc] init];
    rightButtonTwo.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [rightButtonTwo setImage:[UIImage imageNamed:@"home_navigation_left_calendar_icon"] forState:UIControlStateNormal];
    [rightButtonTwo setTintColor:[UIColor whiteColor]];
    rightButtonTwo.cd_size = CGSizeMake(30.0, 20.0);
    rightButtonTwo.tag = 1;
    [rightButtonTwo addTarget:self action:@selector(navigationButtonPressEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];// 监听按钮点击
    
    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:rightButtonTwo],[[UIBarButtonItem alloc] initWithCustomView:rightButtonOne]];
    
    
    /***** 右侧按钮 *****/
    UIButton *leftButton = [[UIButton alloc] init];
    leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [leftButton setImage:[UIImage imageNamed:@"home_navigation_right_add_new_note_icon"] forState:UIControlStateNormal];
    [leftButton setTintColor:[UIColor whiteColor]];
    leftButton.cd_size = CGSizeMake(30.0, 20.0);
    leftButton.tag = 3;
    // 监听按钮点击
    [leftButton addTarget:self action:@selector(navigationButtonPressEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}


#pragma mark - IBAction Method
- (void)navigationButtonPressEvent:(UIButton *)button
{
    switch (button.tag) {
        case 0:
        {
            // 点击切换列表筛选条件
            self.filterView.hidden = self.filterView.tag;
            self.filterView.tag = !(self.filterView.tag);
            
        }
            break;
        case 1:
        {
            // 点击进入日期选择
            
        }
            break;
        case 2:
        {
            // 点击开始搜索
            
        }
            break;
        case 3:
        {
            // 点击添加新的记事本
            
        }
            break;
        default:
            break;
    }
}

#pragma mark - TableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDNoteItemCell *cell = [[CDNoteItemCell alloc] initWithRestorationIdentifier:@"" onTableView:tableView selectionStyle:UITableViewCellSelectionStyleNone];
//    cell.backgroundColor = [UIColor clearColor];
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"记事本第 %zi 条",indexPath.row];
//    cell.textLabel.textColor = COLOR_TITLE2;
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [[[CDNoteItemCell alloc] init] fitHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8.0; // cell之间的间距
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

//加入左滑删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setEditing:false animated:NO];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
{
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {        
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要删除这条笔记吗？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }];
    return @[deleteRowAction];
}

#pragma mark - Getter Method
- (UIButton *)buttonTitle
{
    if (_buttonTitle == nil) {
        _buttonTitle = [[UIButton alloc] init];
        
        UILabel *label = [[UILabel alloc] init];
        label.tag = 100;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = UIFONT_14;
        label.textColor = COLOR_TITLE1;
        [_buttonTitle addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_buttonTitle);
            make.top.equalTo(_buttonTitle);
            make.bottom.equalTo(_buttonTitle);
            make.width.equalTo(@25.0);
        }];
        
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = [UIImage imageNamed:@"home_navigation_row_down"];
        [_buttonTitle addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(label.mas_left);
            make.centerY.equalTo(label.mas_centerY);
            make.height.equalTo(@12.0);
            make.width.equalTo(@12.0);
        }];
        
        
    }
    return _buttonTitle;
}

- (CDFilterSelectView *)filterView
{
    if (_filterView == nil) {
        _filterView = [[CDFilterSelectView alloc] initWithFilterDataList:@[@"全部",@"本周",@"本月",@"一个月前",@"标记收藏"]];
        [self.view addSubview:_filterView];
        [_filterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.centerX.equalTo(self.view);
            make.height.equalTo(@160);
            make.width.equalTo(@120);
        }];
    }
    return _filterView;
}


- (UITableView *)tableViewNotes
{
    if (_tableViewNotes == nil) {
        _tableViewNotes = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableViewNotes.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableViewNotes.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_tableViewNotes];
        [_tableViewNotes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
        
    }
    return _tableViewNotes;
}

@end
