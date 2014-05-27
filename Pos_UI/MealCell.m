//
//  MealCell.m
//  Pos_UI
//
//  Created by 周健 on 14-5-26.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "MealCell.h"
#import "PinyinHelper.h"

@implementation MealCellObject
- (UINib *)collectionViewCellNib{
    return [UINib nibWithNibName:@"MealCell" bundle:nil];
}

+ (instancetype)objectWithTitle:(NSString *)title price:(double)price{
    MealCellObject *object = [[[self class] alloc] init];
    object.title = title;
    object.price = price;
    object.shortCut = [PinyinHelper getPinyinFirstLetter:title];
    return object;
}

@end

@implementation MealCell
-(BOOL)shouldUpdateCellWithObject:(MealCellObject *)object{
    self.title.text = object.title;
    return YES;
}

+ (BOOL)shouldAppendObjectClassToReuseIdentifier{
    return YES;
}

@end
