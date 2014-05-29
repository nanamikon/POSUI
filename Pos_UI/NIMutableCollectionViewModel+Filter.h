//
//  NIMutableCollectionViewModel+Filter.h
//  Pos_UI
//
//  Created by 周健 on 14-5-27.
//  Copyright (c) 2014年 周健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NimbusCollections.h"
#import "NICollectionViewModel+Private.h"

@interface NIMutableCollectionViewModel(Filter)
//- (void)filterWith:(BOOL(^)(id))filterBlock;
- (id)initWithFilterSectionedArray:(NSArray *)sectionedArray delegate:(id<NICollectionViewModelDelegate>)delegate;

- (NSIndexPath *)indexPathForSectionWithTitle:(NSString *)title;
@end

//@interface NICollectionViewModelSection(Filter)<copy>
//@end
