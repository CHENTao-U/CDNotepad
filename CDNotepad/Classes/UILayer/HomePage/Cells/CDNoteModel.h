//
//  CDNoteModel.h
//  CDNotepad
//
//  Created by Cindy on 2017/1/9.
//  Copyright © 2017年 Comtop. All rights reserved.
//

#import "CDBaseObject.h"

@interface CDNoteModel : CDBaseObject

@property (nonatomic,retain) NSString *title;

@property (nonatomic,strong) NSArray *voicePathList;
@property (nonatomic,strong) NSArray *picturePathList;

@property (nonatomic,strong) NSDate *createDate;

@property (nonatomic,assign) BOOL mark;


@end
