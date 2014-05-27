//
//  MealOrderCell.m
//  Pos_UI
//
//  Created by 周健 on 14-5-27.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "MealOrderCell.h"

@implementation MealOrderCellObject
#pragma mark - NINibCellObject
- (UINib *)cellNib{
    return [UINib nibWithNibName:@"MealOrderCell" bundle:nil];
}

+ (instancetype)objectWithName:(NSString *)name price:(double)price total:(NSInteger)total{
    MealOrderCellObject* object = [[[self class] alloc] init];
    object.mealName = name;
    object.mealTotal = total;
    object.price = price;
    [object computOrderTotal];
    return object;
}

- (void)computOrderTotal{
    _mealOrderTotal = _mealTotal * _price;
}

@end

@implementation MealOrderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - NICell

-(BOOL)shouldUpdateCellWithObject:(MealOrderCellObject *)object{
    self.mealNameLabel.text = object.mealName;
    self.mealTotalLabel.text = [@(object.mealTotal) stringValue];
    self.mealOrderTotalLabel.text = [@(object.mealOrderTotal) stringValue];
    return YES;
}


+ (BOOL)shouldAppendObjectClassToReuseIdentifier{
    return YES;
}
@end
