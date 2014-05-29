//
//  CustomUIView.h
//  Pos_UI
//
//  Created by 周健 on 14-5-29.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPlaceHolderUIView : UIView

@property (weak, nonatomic) IBOutlet UIView *nibView;

- (void)styleNibSubview; //internal

-(NSString *)getXIBName;

@end
