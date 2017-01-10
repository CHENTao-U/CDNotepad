//
//  CDAddOrEditNoteViewController.m
//  CDNotepad
//
//  Created by Cindy on 2017/1/9.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDAddOrEditNoteViewController.h"
#import "CDInputCollectionCell.h"

@interface CDAddOrEditNoteViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionViewAdd;

@end

@implementation CDAddOrEditNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectionViewAdd.delegate = self;
    self.collectionViewAdd.dataSource = self;
    
}


#pragma mark -  Collection View Delegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionViewAdd registerClass:[CDInputCollectionCell class] forCellWithReuseIdentifier:@"CDInputCollectionCell"];
    CDInputCollectionCell * cell = (CDInputCollectionCell *)[self.collectionViewAdd dequeueReusableCellWithReuseIdentifier:@"CDInputCollectionCell" forIndexPath:indexPath];
    
//    ZCCommanLinerModel *LineModel = _arrayDataSource[indexPath.section][indexPath.row];
//    
//    [cell initWithMenuTitle:LineModel.productCaption?LineModel.productCaption:@""];
    
    
    switch ([indexPath section]) {
        case 0:
        {
            // 文字输入
            cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        }
            break;
        case 1:
        {
            // 语音
            cell.backgroundColor = [UIColor yellowColor];
        }
            break;
        case 2:
        {
            // 图片
            cell.backgroundColor = [UIColor greenColor];
        }
            break;
        default:
            break;
    }
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark  Item Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeZero;
    switch ([indexPath section]) {
        case 0:
        {
            // 文字输入
            size = CGSizeMake(collectionView.cd_width, 150.0);
        }
            break;
        case 1:
        {
            // 语音
            size = CGSizeMake(collectionView.cd_width, 50.0);
        }
            break;
        case 2:
        {
            // 图片
            CGFloat width = collectionView.cd_width/3.0 - 5.0;
            size = CGSizeMake(width, width);
        }
            break;
        default:
            break;
    }
    return size;
}

#pragma mark  Item Number  And  Section Number
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger number;
    switch (section) {
        case 0:
        {
            // 文字输入
            number = 1;
        }
            break;
        case 1:
        {
            // 语音
            number = 2;
        }
            break;
        case 2:
        {
            // 图片
            number = 3;
        }
            break;
        default:
            break;
    }
    
    return number;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

#pragma mark  Item  Spacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}

#pragma mark - Getter Method
- (UICollectionView *)collectionViewAdd
{
    if (_collectionViewAdd == nil) {
        CDCollectionViewFlowLayout *flowLayout= [[CDCollectionViewFlowLayout alloc]init];
        flowLayout.isSuspend = YES;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionViewAdd.collectionViewLayout = flowLayout;
        _collectionViewAdd = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionViewAdd.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionViewAdd.alwaysBounceVertical = YES;
        [self.view addSubview:_collectionViewAdd];
        [_collectionViewAdd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view).offset(5.0);
            make.right.equalTo(self.view).offset(-5.0);
            make.bottom.equalTo(self.view);
        }];
        
    }
    return _collectionViewAdd;
}


@end
