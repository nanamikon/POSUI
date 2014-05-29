//
//  CashierView.m
//  Pos_UI
//
//  Created by 周健 on 14-5-28.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "CashierView.h"
#import "LayoutViewController.h"

@implementation CashierView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        NSArray* list = [[NSBundle mainBundle] loadNibNamed:@"CashierView" owner:self options:nil];
        UIView *view = [list objectsAtIndexes:0];
        [self addSubview:view];
        return self;
        
    }
    return nil;
}

#pragma mark - KeyboardDelegate
- (void)keyboardInput:(NSString *)text{
    [self.payMountTextView.text stringByAppendingString:text];
    double change = [self.totalMountLabel.text doubleValue] - [self.payMountTextView.text doubleValue];
    change = change > 0 ? change : 0;
    self.changeMountLabel.text = [@(change) stringValue];
}

- (void)awakeFromNib{
    self.totalMountLabel.text = [@(((LayoutViewController *)self.superview).totalPrice) stringValue];
}

@end
