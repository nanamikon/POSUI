//
//  MealCell.h
//  Pos_UI
//
//  Created by 周健 on 14-5-26.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NimbusCollections.h"


@interface MealCellObject : NSObject<NICollectionViewNibCellObject>
@property (nonatomic, copy) NSString *title;
@property double price;
@property (nonatomic, copy) NSString *shortCut;

+ (instancetype)objectWithTitle:(NSString *)title price:(double)price;
@end


@interface MealCell : UICollectionViewCell<NICollectionViewCell>
@property (strong, nonatomic) IBOutlet UILabel *title;

@end

