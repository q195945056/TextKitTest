//
//  YLLabel.m
//  TextKitTest
//
//  Created by 严明俊 on 16/3/30.
//  Copyright © 2016年 yanmingjun. All rights reserved.
//

#import "YLLabel.h"
#import <CoreText/CoreText.h>

@implementation YLLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - Properties Methods

- (void)setText:(NSString *)text {
    if (_text != text && ![_text isEqualToString:text]) {
        _text = text;
        [self.layer setNeedsDisplay];
    }
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    if (_attributedText != attributedText && ![_attributedText isEqualToAttributedString:attributedText]) {
        _attributedText = attributedText;
        [self.layer setNeedsDisplay];
    }
}

#pragma mark - Draw Method
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    if (!self.attributedText && !self.text) {
        return;
    }
    
    CGContextSaveGState(ctx);
    
    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    
    NSAttributedString *attributedString = self.attributedText;
    if (!attributedString) {
        attributedString = [[NSAttributedString alloc] initWithString:self.text];
    }
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(framesetter);
    CTFrameDraw(frame, ctx);
    CFRelease(frame);
    
    CGContextRestoreGState(ctx);
}

@end
