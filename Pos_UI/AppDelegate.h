//
//  AppDelegate.h
//  Pos_UI
//
//  Created by 周健 on 14-5-20.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) LayoutViewController *layoutViewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end