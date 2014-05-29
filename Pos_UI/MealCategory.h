//
//  MealCategory.h
//  Pos_UI
//
//  Created by 周健 on 14-5-28.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NimbusCollections.h"


@interface MealCategoryObject : NSObject<NICollectionViewNibCellObject>
@property (nonatomic, copy) NSString *title;

+ (instancetype)objectWithTitle:(NSString *)title;
@end


@interface MealCategory : UICollectionViewCell<NICollectionViewCell>
@property (strong, nonatomic) IBOutlet UILabel *title;

@end

