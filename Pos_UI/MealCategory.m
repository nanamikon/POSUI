//
//  MealCategory.m
//  Pos_UI
//
//  Created by 周健 on 14-5-28.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "MealCategory.h"

@implementation MealCategoryObject
- (UINib *)collectionViewCellNib{
    return [UINib nibWithNibName:@"MealCategory" bundle:nil];
}

+ (instancetype)objectWithTitle:(NSString *)title{
    MealCategoryObject *object = [[[self class] alloc] init];
    object.title = title;
    return object;
}

- (BOOL)isEqual:(MealCategoryObject *)object{
    return [object.title isEqual:self.title];
}

@end

@implementation MealCategory
-(BOOL)shouldUpdateCellWithObject:(MealCategoryObject *)object{
    self.title.text = object.title;
    return YES;
}

+ (BOOL)shouldAppendObjectClassToReuseIdentifier{
    return YES;
}

@end
