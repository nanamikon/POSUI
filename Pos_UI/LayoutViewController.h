//
//  LayoutViewController.h
//  Pos_UI
//
//  Created by 周健 on 14-5-20.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NimbusModels.h"
#import "NimbusCore.h"

@interface LayoutViewController : UIViewController<
UITableViewDelegate,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
NIMutableTableViewModelDelegate
>
@property (strong, nonatomic) IBOutlet UITableView *mealOrderTableView;
@property (strong, nonatomic) IBOutlet UICollectionView *mealItemCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionView *mealCategoryCollectionView;
@end
