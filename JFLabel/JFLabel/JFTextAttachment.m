//
//  JFTextAttachment.m
//  JFLabel
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 pengjf. All rights reserved.
//

#import "JFTextAttachment.h"

@implementation JFTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex{
    [super attachmentBoundsForTextContainer:textContainer proposedLineFragment:lineFrag glyphPosition:position characterIndex:charIndex];
    
    CGFloat attachmentWidth = CGRectGetWidth(lineFrag) - textContainer.lineFragmentPadding * 2;
    return [self scaleImageSizeToWidth:attachmentWidth];
    
}

- (CGRect)scaleImageSizeToWidth:(CGFloat)Width{
    
    CGFloat factor  =  Width/self.image.size.width;
    return CGRectMake(0, 0, self.image.size.width * factor, self.image.size.height * factor);
}
@end
