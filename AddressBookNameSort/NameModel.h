//
//  NameModel.h
//  Refresh
//
//  Created by Funny on 2017/6/16.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CharacatorNumberArray  @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"]


@interface NameModel : NSObject

@property(copy,nonatomic)NSString *chineseCharacter;

@property(copy,nonatomic)NSString *initialString;

@property(copy,nonatomic)NSString *pinyin;

@end
