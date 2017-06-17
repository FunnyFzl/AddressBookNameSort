//
//  SortNameTool.m
//  YouYouBao
//
//  Created by Funny on 2017/6/16.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "SortNameTool.h"

@interface SortNameTool ()

@property(nonatomic)NSMutableArray *nameModels;


@end

@implementation SortNameTool


- (NSArray *)getTableArrayWithNames:(NSArray *)names {

    NSMutableArray *nameModels = [self sortToNameModelsWithAllNames:names];
    
    NSMutableArray *endModels = [self sortNameModelsWithsortedNameModels:nameModels];
    
    return endModels;
}

#pragma mark - 把名字数组的model按照ABCD分成 块model
- (NSMutableArray *)sortNameModelsWithsortedNameModels:(NSMutableArray *)sortedNameModels {
    
    NSMutableArray *namesArray = [NSMutableArray arrayWithCapacity:10];
    
    for (int i = 0; i < self.initialArray.count; i ++ ) {
        
        NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:5];
    
        for (int j = 0; j < sortedNameModels.count; j ++ ) {
            
//            BOOL flag = NO;
            
            NameModel *nameModel = sortedNameModels[j];
            if ([nameModel.initialString isEqualToString:self.initialArray[i]]) {
                [numbers addObject:nameModel];
//                flag = YES;
            }
            
//            if (flag == NO) {
//                break;
//            }
        }
        
        [sortedNameModels removeObjectsInArray:numbers];
        
        [namesArray addObject:numbers];
    }

    return namesArray;
}

#pragma mark - 将所有的名字按首字母排序 返回 model
- (NSMutableArray *)sortToNameModelsWithAllNames:(NSArray *)names {
    
    NSMutableArray *nameModels = [NSMutableArray arrayWithCapacity:100];
    NSMutableSet *upperset = [NSMutableSet setWithCapacity:5];
    
    for (NSString *name in names) {
        NameModel *nameModel = [[NameModel alloc]init];
        nameModel.chineseCharacter = name;
        [upperset addObject:nameModel.initialString];
        [nameModels addObject:nameModel];
    }
    
    //对去重后的首字母数组排序,因为排序后的字符串特殊字符在最前面，所以先移除再排序之后再追加上
    BOOL special = NO;
    if ([upperset containsObject:@"#"]) {
        [upperset removeObject:@"#"];
        special = YES;
    }
    NSArray *sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
    self.initialArray = [upperset sortedArrayUsingDescriptors:sortDesc];
    if (special == YES) {
       self.initialArray = [self.initialArray arrayByAddingObject:@"#"];
    }
    
    //自带的排序规则
    NSArray *ssortDesc = @[[[NSSortDescriptor alloc] initWithKey:@"pinyin" ascending:YES]];
    NSArray *models = [nameModels sortedArrayUsingDescriptors:ssortDesc];
    NSMutableArray *endModels = [NSMutableArray arrayWithArray:models];
    
    return endModels;
    
    
    
    /*
    //冒泡排序
    BOOL flag = NO;
    
    for (int i = 0; i< nameModels.count - 1; i ++) {
        
        flag = NO;
        
        for (int j = 0; j< nameModels.count - 1 - i; j ++) {
            
            flag = YES;
            
            NameModel *j_model = nameModels[j];
            NameModel *jm_model = nameModels[j+1];
            
            NSString *first = j_model.pinyin;
            NSString *second = jm_model.pinyin;
            
            NSComparisonResult result = [first compare:second options:NSDiacriticInsensitiveSearch | NSWidthInsensitiveSearch | NSCaseInsensitiveSearch];
            
            if (result == NSOrderedDescending) {
                
                [nameModels exchangeObjectAtIndex:j withObjectAtIndex:(j + 1)];
                
            }
        }
        
        if (flag == NO) {
            break;
        }
    }
    
    
    return nameModels;
     */
}
@end
