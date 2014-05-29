//
//  NIMutableCollectionViewModel+Filter.m
//  Pos_UI
//
//  Created by 周健 on 14-5-27.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import "NIMutableCollectionViewModel+Filter.h"
#import "NICollectionViewModel+Private.h"

@implementation NIMutableCollectionViewModel(Filter)
//- (void)filterWith:(BOOL(^)(id))filterBlock{
//    NSMutableArray *newSections = [[NSMutableArray alloc] init];
//    for (int i=0; i<[self.sections count]; i++) {
//        NSMutableArray *newSection = [[NSMutableArray alloc] init];
//        NICollectionViewModelSection *section = [self.sections objectAtIndex:i];
//        for (id object in section) {
//            if(filterBlock(object)){
//                [newSection addObject:object];
//            }
//        }
//        if ([section count] > 0) {
//            [newSections addObject:section];
//        }
//    }
//    self.sections = newSections;
//}

- (id)copyWithZone:(NSZone *)zone{
    NIMutableCollectionViewModel *model = [[NIMutableCollectionViewModel allocWithZone:zone] initWithDelegate:self.delegate];
    model.sections = self.sections;
    return model;
}

- (id)initWithFilterSectionedArray:(NSArray *)sectionedArray delegate:(id<NICollectionViewModelDelegate>)delegate{
    if ((self = [self initWithDelegate:delegate])) {
        
    }
    return self;
}

- (NSIndexPath *)indexPathForSectionWithTitle:(NSString *)title {
    if (nil == title) {
        return nil;
    }
    
    NSArray *sections = self.sections;
    for (NSUInteger sectionIndex = 0; sectionIndex < [sections count]; sectionIndex++) {
        NICollectionViewModelSection *section = [sections objectAtIndex:sectionIndex];
        if ([section.headerTitle isEqualToString:title] && [section.rows count]>0) {
            return [NSIndexPath indexPathForRow:0 inSection:sectionIndex];
        }
    }
    
    return nil;
}
@end
