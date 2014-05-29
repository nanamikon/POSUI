//
//  Keyboard.m
//  Pos_UI
//
//  Created by 周健 on 14-5-29.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "KeyboardView.h"

@implementation KeyBoardPlaceHolderView
-(NSString *)getXIBName{
    return @"KeyboardView";
}
@end

@implementation KeyboardView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

-(void)buttonClick:(UIButton *)sender{
    NSLog(@"click");
    if(sender.tag == -1){
        [self.delegate keyboardBackspace];
    }else if(sender.tag == -2){
        [self.delegate keyboardConfirme];
    }else{
        [self.delegate keyboardInput:sender.currentTitle];
    }
}


-(void)awakeFromNib{
    for(id view in self.subviews){
        if ([view isKindOfClass:[UIButton class]]) {
            [((UIButton *)view) addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
