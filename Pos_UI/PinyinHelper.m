//
//  PinyinHelper.m
//  Pos_UI
//
//  Created by 周健 on 14-5-27.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "PinyinHelper.h"
#import "pinyin.h"

@implementation PinyinHelper
+ (NSString *)getPinyinFirstLetter:(NSString *)source{
    NSString *result = @"";
    if ([source length] != 0) {
        for (int i=0; i<[source length]; i++) {
            result =[result stringByAppendingString:
             [NSString stringWithFormat:@"%c",pinyinFirstLetter([source characterAtIndex:i])]];
        }
    }
    return result;
}
@end
