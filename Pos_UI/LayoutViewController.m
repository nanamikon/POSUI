//
//  LayoutViewController.m
//  Pos_UI
//
//  Created by 周健 on 14-5-20.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "LayoutViewController.h"
#import "MealCell.h"
#import "MealOrderCell.h"
#import "NIMutableCollectionViewModel+Filter.h"
#import "MealCategory.h"



@interface LayoutViewController ()
@property (nonatomic, strong) NIMutableCollectionViewModel* mealItemModel;
@property (nonatomic, strong) NIMutableCollectionViewModel* mealCategoryModel;
@property (nonatomic, strong) NIMutableTableViewModel* mealOrderModel;

@property (nonatomic, strong) NSMutableDictionary* mealOrderIndexMap;
@property BOOL showCashier;
@end

@implementation LayoutViewController{
    NSArray* _mealItemArray;
}

- (NSArray*) prepareMealItems{
    NSArray* mealItems = @[
      @"主菜1",
      [MealCellObject objectWithTitle:@"大白菜" price:10],
      [MealCellObject objectWithTitle:@"大盘鸡" price:50],
      [MealCellObject objectWithTitle:@"水煮鱼" price:33],
      [MealCellObject objectWithTitle:@"臭豆腐" price:12],
      [MealCellObject objectWithTitle:@"红烧肉" price:28],
      [MealCellObject objectWithTitle:@"番茄炒蛋" price:12],
      [MealCellObject objectWithTitle:@"鱼香肉丝" price:15.5],
      [MealCellObject objectWithTitle:@"宫保鸡丁" price:17],
      [MealCellObject objectWithTitle:@"地三鲜" price:20],
      [MealCellObject objectWithTitle:@"鱼跃龙门" price:100],
      [MealCellObject objectWithTitle:@"火焰虾" price:30],
      [MealCellObject objectWithTitle:@"白切鸡" price:30],
      @"甜品1",
      [MealCellObject objectWithTitle:@"布丁" price:3],
      [MealCellObject objectWithTitle:@"绿豆沙" price:4],
      [MealCellObject objectWithTitle:@"豆腐花" price:3],
      [MealCellObject objectWithTitle:@"糖水" price:4],
      [MealCellObject objectWithTitle:@"芒果沙冰" price:11],
      @"主菜2",
      [MealCellObject objectWithTitle:@"大白菜" price:10],
      [MealCellObject objectWithTitle:@"大盘鸡" price:50],
      [MealCellObject objectWithTitle:@"水煮鱼" price:33],
      [MealCellObject objectWithTitle:@"臭豆腐" price:12],
      [MealCellObject objectWithTitle:@"红烧肉" price:28],
      [MealCellObject objectWithTitle:@"番茄炒蛋" price:12],
      [MealCellObject objectWithTitle:@"鱼香肉丝" price:15.5],
      [MealCellObject objectWithTitle:@"宫保鸡丁" price:17],
      [MealCellObject objectWithTitle:@"地三鲜" price:20],
      [MealCellObject objectWithTitle:@"鱼跃龙门" price:100],
      [MealCellObject objectWithTitle:@"火焰虾" price:30],
      [MealCellObject objectWithTitle:@"白切鸡" price:30],
      @"甜品2",
      [MealCellObject objectWithTitle:@"布丁" price:3],
      [MealCellObject objectWithTitle:@"绿豆沙" price:4],
      [MealCellObject objectWithTitle:@"豆腐花" price:3],
      [MealCellObject objectWithTitle:@"糖水" price:4],
      [MealCellObject objectWithTitle:@"芒果沙冰" price:11],
      @"主菜3",
      [MealCellObject objectWithTitle:@"大白菜" price:10],
      [MealCellObject objectWithTitle:@"大盘鸡" price:50],
      [MealCellObject objectWithTitle:@"水煮鱼" price:33],
      [MealCellObject objectWithTitle:@"臭豆腐" price:12],
      [MealCellObject objectWithTitle:@"红烧肉" price:28],
      [MealCellObject objectWithTitle:@"番茄炒蛋" price:12],
      [MealCellObject objectWithTitle:@"鱼香肉丝" price:15.5],
      [MealCellObject objectWithTitle:@"宫保鸡丁" price:17],
      [MealCellObject objectWithTitle:@"地三鲜" price:20],
      [MealCellObject objectWithTitle:@"鱼跃龙门" price:100],
      [MealCellObject objectWithTitle:@"火焰虾" price:30],
      [MealCellObject objectWithTitle:@"白切鸡" price:30],
      @"甜品3",
      [MealCellObject objectWithTitle:@"布丁" price:3],
      [MealCellObject objectWithTitle:@"绿豆沙" price:4],
      [MealCellObject objectWithTitle:@"豆腐花" price:3],
      [MealCellObject objectWithTitle:@"糖水" price:4],
      [MealCellObject objectWithTitle:@"芒果沙冰" price:11],
      @"主菜4",
      [MealCellObject objectWithTitle:@"大白菜" price:10],
      [MealCellObject objectWithTitle:@"大盘鸡" price:50],
      [MealCellObject objectWithTitle:@"水煮鱼" price:33],
      [MealCellObject objectWithTitle:@"臭豆腐" price:12],
      [MealCellObject objectWithTitle:@"红烧肉" price:28],
      [MealCellObject objectWithTitle:@"番茄炒蛋" price:12],
      [MealCellObject objectWithTitle:@"鱼香肉丝" price:15.5],
      [MealCellObject objectWithTitle:@"宫保鸡丁" price:17],
      [MealCellObject objectWithTitle:@"地三鲜" price:20],
      [MealCellObject objectWithTitle:@"鱼跃龙门" price:100],
      [MealCellObject objectWithTitle:@"火焰虾" price:30],
      [MealCellObject objectWithTitle:@"白切鸡" price:30],
      @"甜品4",
      [MealCellObject objectWithTitle:@"布丁" price:3],
      [MealCellObject objectWithTitle:@"绿豆沙" price:4],
      [MealCellObject objectWithTitle:@"豆腐花" price:3],
      [MealCellObject objectWithTitle:@"糖水" price:4],
      [MealCellObject objectWithTitle:@"芒果沙冰" price:11],
      @"主菜5",
      [MealCellObject objectWithTitle:@"大白菜" price:10],
      [MealCellObject objectWithTitle:@"大盘鸡" price:50],
      [MealCellObject objectWithTitle:@"水煮鱼" price:33],
      [MealCellObject objectWithTitle:@"臭豆腐" price:12],
      [MealCellObject objectWithTitle:@"红烧肉" price:28],
      [MealCellObject objectWithTitle:@"番茄炒蛋" price:12],
      [MealCellObject objectWithTitle:@"鱼香肉丝" price:15.5],
      [MealCellObject objectWithTitle:@"宫保鸡丁" price:17],
      [MealCellObject objectWithTitle:@"地三鲜" price:20],
      [MealCellObject objectWithTitle:@"鱼跃龙门" price:100],
      [MealCellObject objectWithTitle:@"火焰虾" price:30],
      [MealCellObject objectWithTitle:@"白切鸡" price:30],
      @"甜品5",
      [MealCellObject objectWithTitle:@"布丁" price:3],
      [MealCellObject objectWithTitle:@"绿豆沙" price:4],
      [MealCellObject objectWithTitle:@"豆腐花" price:3],
      [MealCellObject objectWithTitle:@"糖水" price:4],
      [MealCellObject objectWithTitle:@"芒果沙冰" price:11],
      @"主菜6",
      [MealCellObject objectWithTitle:@"大白菜" price:10],
      [MealCellObject objectWithTitle:@"大盘鸡" price:50],
      [MealCellObject objectWithTitle:@"水煮鱼" price:33],
      [MealCellObject objectWithTitle:@"臭豆腐" price:12],
      [MealCellObject objectWithTitle:@"红烧肉" price:28],
      [MealCellObject objectWithTitle:@"番茄炒蛋" price:12],
      [MealCellObject objectWithTitle:@"鱼香肉丝" price:15.5],
      [MealCellObject objectWithTitle:@"宫保鸡丁" price:17],
      [MealCellObject objectWithTitle:@"地三鲜" price:20],
      [MealCellObject objectWithTitle:@"鱼跃龙门" price:100],
      [MealCellObject objectWithTitle:@"火焰虾" price:30],
      [MealCellObject objectWithTitle:@"白切鸡" price:30],
      @"甜品6",
      [MealCellObject objectWithTitle:@"布丁" price:3],
      [MealCellObject objectWithTitle:@"绿豆沙" price:4],
      [MealCellObject objectWithTitle:@"豆腐花" price:3],
      [MealCellObject objectWithTitle:@"糖水" price:4],
      [MealCellObject objectWithTitle:@"芒果沙冰" price:11],
      [MealCellObject objectWithTitle:@"芝士蛋糕" price:21]
      ];
    return mealItems;
}

- (NSArray*) prepareCategorys:(NSArray *)mealItems{
    NSMutableArray* categorys = [[NSMutableArray alloc] init];
    for (id object in mealItems) {
        if ([object isKindOfClass:[NSString class]]) {
            [categorys addObject:[MealCategoryObject objectWithTitle:object]];
        }
    }
    return categorys;
}

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
    
    _mealItemArray = [self prepareMealItems];
    self.mealItemModel = [[NIMutableCollectionViewModel alloc] initWithSectionedArray:_mealItemArray
                                                     delegate:(id)[NICollectionViewCellFactory class]];
    
    self.mealItemCollectionView.dataSource = self.mealItemModel;
    
    // Do any additional setup after loading the view from its nib.
    
    self.mealItemCollectionView.delegate = self;
    
    //设置secion间隔
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.mealItemCollectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    
    
    // meal order table view
    self.mealOrderModel = [[NIMutableTableViewModel alloc] initWithDelegate:self];
    
    self.mealOrderTableView.dataSource = self.mealOrderModel;

    [self.mealOrderModel addSectionWithTitle:@"菜单"];
    
    // meal order table view
    self.mealCategoryModel = [[NIMutableCollectionViewModel alloc] initWithListArray:[self prepareCategorys:_mealItemArray] delegate:(id)[NICollectionViewCellFactory class]];
    self.mealCategoryCollectionView.dataSource = self.mealCategoryModel;

    self.mealCategoryCollectionView.delegate = self;
    
    
    self.mealSearchBar.delegate = self;
    
    self.cashierView = [[CashierView alloc] initWithFrame:CGRectMake(214,0,804,768)];
    //self.cashierView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.cashierView];
    [self.cashierView setHidden:YES];
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
    if (collectionView == self.mealItemCollectionView) {
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
        
        _totalPrice += mealCellObject.price;
        [self.mealOrderTableView reloadData];
        [self.mealOrderTableView scrollToRowAtIndexPath:mealOrderIndex atScrollPosition:UITableViewScrollPositionBottom animated:true];
    }else{
        MealCategoryObject *mealCategoryObject = [self.mealCategoryModel objectAtIndexPath:indexPath];
        NSIndexPath *path = [self.mealItemModel indexPathForSectionWithTitle:mealCategoryObject.title];
        if (path) {
            [self.mealItemCollectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionTop animated:true];
        }

    }

}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"should select");

    return YES;
}

#pragma mark - NIMutableTableViewModelDelegate
- (UITableViewCell *)tableViewModel:(NITableViewModel *)tableViewModel cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
     return [NICellFactory tableViewModel:tableViewModel cellForTableView:tableView atIndexPath:indexPath withObject:object];
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length]==0) {
        self.mealItemModel = [self.mealItemModel initWithSectionedArray:_mealItemArray
                                                               delegate:(id)[NICollectionViewCellFactory class]];
    }
    else{
        NSMutableArray *filterMealItemArray = [[NSMutableArray alloc] init];
        for (id object in _mealItemArray) {
            if ([object isKindOfClass:[NSString class]]) {
                [filterMealItemArray addObject:object];
            }else{
                if ([((MealCellObject *)object).shortCut hasPrefix:searchText]) {
                    [filterMealItemArray addObject:object];
                }
            }
        }
        self.mealItemModel = [self.mealItemModel initWithSectionedArray:filterMealItemArray
                                                               delegate:(id)[NICollectionViewCellFactory class]];
    }

    [self.mealItemCollectionView reloadData];
}

- (IBAction)cashierButtonPress:(id)sender {

    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;//{kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
    
    //更多私有{@"cube",@"suckEffect",@"oglFlip",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"};
    transition.subtype = kCATransitionFromRight;//{kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom};
    
    transition.delegate = self;
    [self.cashierView.layer addAnimation:transition forKey:nil];
    
    // 要做的
    //[self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    
    if(!self.showCashier){
        //[self.view addSubview:self.cashierView];
        [self.cashierView setHidden:NO];
        
    }else{
        [self.cashierView setHidden:YES];
        //[self.cashierView removeFromSuperview];
    }
    
    self.showCashier = !self.showCashier;
}


@end
