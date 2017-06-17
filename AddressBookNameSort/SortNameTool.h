//
//  SortNameTool.h
//  YouYouBao
//
//  Created by Funny on 2017/6/16.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NameModel.h"

@interface SortNameTool : NSObject

/**
 首字母数组
 */
@property(nonatomic)NSArray *initialArray;


/**
 调用此方法就可直接排序

 @param names 无序的名字数组
 */
- (NSArray *)getTableArrayWithNames:(NSArray *)names;

@end
