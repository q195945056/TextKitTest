//
//  YLTextView.m
//  TextKitTest
//
//  Created by 严明俊 on 16/3/30.
//  Copyright © 2016年 yanmingjun. All rights reserved.
//

#import "YLTextView.h"
#import "YLTextContainer.h"
#import <CoreText/CoreText.h>

@interface YLTextView ()

@property(nonatomic, readwrite) YLTextContainer *textContainer NS_AVAILABLE_IOS(7_0);

@end

@implementation YLTextView

#pragma mark - Init Methods
- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame textContainer:nil];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self initWithFrame:self.frame textContainer:self.textContainer];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(YLTextContainer *)textContainer {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.textContainer = textContainer;
    }
    return self;
}

#pragma mark - Properties Methods

- (void)setText:(NSString *)text {
    if (_text != text && ![_text isEqualToString:text]) {
        _text = text;
        self.layer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer setNeedsDisplay];
    }
}

#pragma mark - Draw Methods

//- (void)drawRect:(CGRect)rect {
//    if (/*!self.attributedText && */!self.text) {
//        return;
//    }
//    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//    CGContextSaveGState(ctx);
//    
//    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
//    
//    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
//    CGContextScaleCTM(ctx, 1, -1);
//    
//    NSAttributedString *attributedString = nil;
//    if (!attributedString) {
//        attributedString = [[NSAttributedString alloc] initWithString:self.text];
//    }
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
//    CTFrameDraw(frame, ctx);
//    
//    CFRelease(framesetter);
//    CFRelease(frame);
//    
//    CGContextRestoreGState(ctx);
//}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    if (/*!self.attributedText && */!self.text) {
        return;
    }
    
    CGContextSaveGState(ctx);
    
    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
    
    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    
    NSAttributedString *attributedString = nil;
    if (!attributedString) {
        attributedString = [[NSAttributedString alloc] initWithString:self.text];
    }
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CTFrameDraw(frame, ctx);
    
    CFRelease(framesetter);
    CFRelease(frame);
    
    CGContextRestoreGState(ctx);
}


@end
