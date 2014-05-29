//
//  CustomUIView.m
//  Pos_UI
//
//  Created by 周健 on 14-5-29.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "CustomPlaceHolderUIView.h"

@implementation CustomPlaceHolderUIView

- (void)styleNibSubview
{
    CGSize size = self.bounds.size;
    self.nibView.frame = CGRectMake(0.0, 0.0, size.width, size.height);
}

- (void)addNibSubview
{
    [[NSBundle mainBundle] loadNibNamed:[self getXIBName] owner:self options:nil];
    [self addSubview:self.nibView];
}

- (id)init
{
    self = [super init];
    if (self) {
        [self addNibSubview];
        [self styleNibSubview];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addNibSubview];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self styleNibSubview];
    self.backgroundColor = [UIColor clearColor];
}

- (NSString *)getXIBName{
    return [[self class] description];
}

@end
