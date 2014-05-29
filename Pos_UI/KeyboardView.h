//
//  Keyboard.h
//  Pos_UI
//
//  Created by 周健 on 14-5-29.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPlaceHolderUIView.h"

@interface KeyBoardPlaceHolderView : CustomPlaceHolderUIView

@end

@protocol KeyboardDelegate <NSObject>
- (void) keyboardInput:(NSString *) text;
- (void) keyboardBackspace;
- (void) keyboardConfirme;
@end

@interface KeyboardView : UIView
@property (nonatomic,assign) id<KeyboardDelegate> delegate;
@end
