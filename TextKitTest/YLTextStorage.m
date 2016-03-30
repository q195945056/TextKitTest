//
//  YLTextStorage.m
//  TextKitTest
//
//  Created by 严明俊 on 16/3/30.
//  Copyright © 2016年 yanmingjun. All rights reserved.
//

#import "YLTextStorage.h"
#import "YLLayoutManager.h"

@interface YLTextStorage ()



@end

@implementation YLTextStorage

#pragma mark - Properties Methods
- (NSArray<YLLayoutManager *> *)layoutManagers {
    if (_layoutManagers) {
        _layoutManagers = [[NSMutableArray alloc] init];
    }
    return _layoutManagers;
}

#pragma mark - Public Methods
- (void)addLayoutManager:(YLLayoutManager *)aLayoutManager {
    [(NSMutableArray *)self.layoutManagers addObject:aLayoutManager];
    aLayoutManager.textStorage = self;
}

- (void)removeLayoutManager:(YLLayoutManager *)aLayoutManager {
    if (aLayoutManager.textStorage == self) {
        aLayoutManager.textStorage = nil;
    }
    [(NSMutableArray *)self.layoutManagers removeObject:aLayoutManager];
}



@end
