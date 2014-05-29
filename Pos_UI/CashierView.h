//
//  CashierView.h
//  Pos_UI
//
//  Created by 周健 on 14-5-28.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardView.h"

@interface CashierView : UIView<
KeyboardDelegate
>
@property (strong, nonatomic) IBOutlet UILabel *totalMountLabel;
@property (strong, nonatomic) IBOutlet UILabel *changeMountLabel;
@property (strong, nonatomic) IBOutlet UITextField *payMountTextView;
@end
