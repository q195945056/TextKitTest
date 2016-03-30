//
//  YLTextStorage.h
//  TextKitTest
//
//  Created by 严明俊 on 16/3/30.
//  Copyright © 2016年 yanmingjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YLLayoutManager;

@interface YLTextStorage : NSMutableAttributedString

// YLLayoutManager objects owned by the receiver.
@property (nonatomic, copy, NS_NONATOMIC_IOSONLY) NSArray<YLLayoutManager *> *layoutManagers;

// Adds aLayoutManager to the receiver.  Sends -[NSLayoutManager setTextStorage:] to aLayoutManager with the receiver.
- (void)addLayoutManager:(YLLayoutManager *)aLayoutManager;


- (void)removeLayoutManager:(YLLayoutManager *)aLayoutManager;


@end
