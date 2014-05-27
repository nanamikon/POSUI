//
//  LayoutViewController.m
//  Pos_UI
//
//  Created by 周健 on 14-5-20.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "LayoutViewController.h"
#import "NICollectionViewModel.h"
#import "MealCell.h"
#import "MealOrderCell.h"



@interface LayoutViewController ()
@property (nonatomic, strong) NICollectionViewModel* mealItemModel;
@property (nonatomic, strong) NIMutableTableViewModel* mealOrderModel;
@property (nonatomic, strong) NSMutableArray* mealOrderContents;

@property (nonatomic, strong) NSMutableDictionary* mealOrderIndexMap;
@end

@implementation LayoutViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mealOrderIndexMap = [[NSMutableDictionary alloc] init];
    
    NSArray* collectionContents =
    @[
      @"主菜",
      [MealCellObject objectWithTitle:@"大白菜" price:10],
      [MealCellObject objectWithTitle:@"大盘鸡" price:15.5],
      [MealCellObject objectWithTitle:@"水煮鱼" price:33],
      [MealCellObject objectWithTitle:@"臭豆腐" price:15.5],
      [MealCellObject objectWithTitle:@"红烧肉" price:15.5],
      [MealCellObject objectWithTitle:@"番茄炒蛋" price:15.5],
      [MealCellObject objectWithTitle:@"鱼香肉丝" price:15.5],
      [MealCellObject objectWithTitle:@"宫保鸡丁" price:15.5],
      [MealCellObject objectWithTitle:@"地三鲜" price:15.5],
      [MealCellObject objectWithTitle:@"鱼跃龙门" price:15.5],
      [MealCellObject objectWithTitle:@"火焰虾" price:15.5],
      [MealCellObject objectWithTitle:@"白切鸡" price:15.5],
      @"甜品",
      [MealCellObject objectWithTitle:@"布丁" price:15.5],
      [MealCellObject objectWithTitle:@"绿豆沙" price:15.5],
      [MealCellObject objectWithTitle:@"豆腐花" price:15.5],
      [MealCellObject objectWithTitle:@"糖水" price:15.5],
      [MealCellObject objectWithTitle:@"芒果沙冰" price:15.5],
      [MealCellObject objectWithTitle:@"芝士蛋糕" price:15.5]
      ];
    self.mealItemModel = [[NICollectionViewModel alloc] initWithSectionedArray:collectionContents
                                                     delegate:(id)[NICollectionViewCellFactory class]];
    self.mealItemCollectionView.dataSource = self.mealItemModel;
    
    self.mealItemCollectionView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
    
    self.mealItemCollectionView.delegate = self;
    
    //设置secion间隔
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.mealItemCollectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    
    
    // meal order table view
    self.mealOrderModel = [[NIMutableTableViewModel alloc] initWithDelegate:self];
    
    self.mealOrderTableView.dataSource = self.mealOrderModel;
    [self.mealOrderModel addSectionWithTitle:@"菜单"];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"did select");
    
    MealCellObject *mealCellObject = [self.mealItemModel objectAtIndexPath:indexPath];

    NSIndexPath* mealOrderIndex = nil;
    if ((mealOrderIndex = (NSIndexPath*)[_mealOrderIndexMap objectForKey:mealCellObject.title])) {
        MealOrderCellObject* mealOrderCellObject = [self.mealOrderModel objectAtIndexPath:mealOrderIndex];
        mealOrderCellObject.mealTotal += 1;
        [mealOrderCellObject computOrderTotal];
    }else{
        NSArray* indexPaths = [self.mealOrderModel addObject:[MealOrderCellObject objectWithName:mealCellObject.title price:mealCellObject.price total:1]];
        [self.mealOrderIndexMap setObject:indexPaths.lastObject forKey:mealCellObject.title];
        mealOrderIndex = indexPaths.lastObject;
    }
    
    
    [self.mealOrderTableView reloadData];
    [self.mealOrderTableView scrollToRowAtIndexPath:mealOrderIndex atScrollPosition:UITableViewScrollPositionBottom animated:true];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"should select");

    return YES;
}

#pragma mark - NIMutableTableViewModelDelegate
- (UITableViewCell *)tableViewModel:(NITableViewModel *)tableViewModel cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
     return [NICellFactory tableViewModel:tableViewModel cellForTableView:tableView atIndexPath:indexPath withObject:object];
}

@end
