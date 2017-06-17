//
//  NameModel.m
//  Refresh
//
//  Created by Funny on 2017/6/16.
//  Copyright © 2017年 Funny. All rights reserved.
//

#import "NameModel.h"

@implementation NameModel

- (void)setChineseCharacter:(NSString *)chineseCharacter {
    _chineseCharacter = chineseCharacter;
    
    NSString *pinyin = [self transformToPinyinWithString:_chineseCharacter];
    
    self.pinyin = pinyin;
    
}

- (NSString *)transformToPinyinWithString:(NSString *)string {
    
    NSMutableString *mutableString = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    
    return [self checkSpecialString:mutableString];
}

#pragma mark - 检查特殊字符 返回#
- (NSString *)checkSpecialString:(NSString *)spacialString {
    
    NSString *upperString = [[spacialString substringToIndex:1] uppercaseString];

    if ([CharacatorNumberArray containsObject:upperString]) {
        self.initialString = upperString;
        return spacialString;
    }else{
        self.initialString = @"#";
        return @"#";
    }
}

@end
