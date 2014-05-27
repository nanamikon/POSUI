//
//  MealOrderCell.h
//  Pos_UI
//
//  Created by 周健 on 14-5-27.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NICellFactory.h"

@interface MealOrderCellObject : NSObject<NINibCellObject>
@property (copy, nonatomic) NSString* mealName;
@property NSInteger mealTotal;
@property double mealOrderTotal;
@property double price;

+ (instancetype)objectWithName:(NSString *)name price:(double)price total:(NSInteger)total;

- (void)computOrderTotal;
@end


@interface MealOrderCell : UITableViewCell<NICell>

@property (strong, nonatomic) IBOutlet UILabel *mealTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *mealOrderTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *mealNameLabel;
@end
