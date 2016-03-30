//
//  YLTextView.h
//  TextKitTest
//
//  Created by 严明俊 on 16/3/30.
//  Copyright © 2016年 yanmingjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YLTextContainer;

@interface YLTextView : UIScrollView

@property (nonatomic, copy, nullable) NSString *text;
@property (nonatomic, readonly, nullable) YLTextContainer *textContainer;
- (nullable instancetype)initWithFrame:(CGRect)frame textContainer:(nullable YLTextContainer *)textContainer NS_AVAILABLE_IOS(7_0) NS_DESIGNATED_INITIALIZER;

@end
