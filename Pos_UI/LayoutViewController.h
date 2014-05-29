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
#import "CashierView.h"

@interface LayoutViewController : UIViewController<
UITableViewDelegate,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
NIMutableTableViewModelDelegate,
UISearchBarDelegate
>
@property (strong, nonatomic) IBOutlet UITableView *mealOrderTableView;
@property (strong, nonatomic) IBOutlet UICollectionView *mealItemCollectionView;
@property (strong, nonatomic) IBOutlet UISearchBar *mealSearchBar;

@property (strong, nonatomic) IBOutlet UICollectionView *mealCategoryCollectionView;

@property (strong, nonatomic) CashierView *  cashierView;
//FIXME: 移到相关的object
@property double totalPrice;
@end
