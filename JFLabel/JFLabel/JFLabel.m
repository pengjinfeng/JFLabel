//
//  JFLabel.m
//  JFLabel
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 pengjf. All rights reserved.
//

#import "JFLabel.h"


@interface JFLabel()

@property (nonatomic,strong)NSMutableAttributedString *jfAttributeText;

@property (nonatomic,strong)NSMutableParagraphStyle *style;

@end

@implementation JFLabel

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self jfLabelPrepare];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self jfLabelPrepare];
        //xib文件是不会执行set方法
        [self setText:self.text];
    }
    return self;
}
//初始化设置
- (void)jfLabelPrepare{
    self.numberOfLines = 0;
    self.textAlignment = NSTextAlignmentCenter;
}
//懒加载style
- (NSMutableParagraphStyle *)style{
    if (_style == nil) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        _style = style;
        //行间距
        style.lineSpacing = 0.0f;
        //段落间距
        style.paragraphSpacing = 0.0f;
        //缩进
        style.firstLineHeadIndent = 0.0f;
        CGFloat height  = self.font.pointSize;
        style.minimumLineHeight = height;
        style.lineHeightMultiple = 0.0f;
        
    }
    return _style;
}
//设置text的时候讲text转化为我们想要的可变字符串
- (void)setText:(NSString *)text{
    [super setText:text];
    
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:text];
    self.jfAttributeText =attriString;
//    self.attributedText = attriString;
}
//行间距
- (void)setLineSpace:(CGFloat)lineSpace{
    _lineSpace = lineSpace;
    self.style.lineSpacing = _lineSpace;
    [self setNeedsDisplay];
}
//缩颈
- (void)setHeadIndentSpace:(CGFloat)headIndentSpace{
    _headIndentSpace = headIndentSpace;
    self.style.firstLineHeadIndent = _headIndentSpace;
    [self setNeedsDisplay];
}
//段落间距
- (void)setParagaraphSpace:(CGFloat)paragaraphSpace{
    _paragaraphSpace = paragaraphSpace;
    self.style.paragraphSpacing = _paragaraphSpace;
    [self setNeedsDisplay];
}
- (void)addJFLabelAttribute:(JFLabelAttribute)attrStyle value:(nonnull id)value range:(NSRange)range{
    switch (attrStyle) {
        case JFLabelAttributeColor:
            //颜色
            [self addAttrWithName:NSForegroundColorAttributeName value:value range:range];
            break;
        case JFLabelAttributeFont:
            [self addAttrWithName:NSFontAttributeName value:value range:range];
            break;
        case JFLabelAttributeKern:
           [self addAttrWithName:NSKernAttributeName value:value range:range];
            break;
        case JFLabelAttributeObliqueness:
            [self addAttrWithName:NSObliquenessAttributeName value:value range:range];
            break;
        case JFLabelAttributeDeleteLine:
            [self addAttrWithName:NSStrikethroughStyleAttributeName value:@(YES) range:range];
            [self addAttrWithName:NSStrikethroughColorAttributeName value:value range:range];
            break;
        case JFLabelAttributeUnderLine:
            [self addAttrWithName:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
            [self addAttrWithName:NSUnderlineColorAttributeName value:value range:range];
            break;
        default:
            break;
    }
}

-(void)addAttrWithName:(NSString *)name value:(id)value range:(NSRange)range{
    
    @try {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.jfAttributeText addAttribute:name value:value range:range];
            self.attributedText=self.jfAttributeText;
        });
    } @catch (NSException *exception) {
        NSLog(@"异常信息===%@===",exception);
    } @finally {
//        NSAssert(NO, @"Value的值是不可以为nil的");
    }
    
    
}


-(void)addImage:(nonnull UIImage *)image size:(CGSize)size offset:(UIOffset)offset location:(NSUInteger)location{
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    //设置图片
    attachment.image = image;
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(self.font.lineHeight, self.font.lineHeight);
    }
    //设置大小
    attachment.bounds = (CGRect){
        CGPointMake(offset.horizontal, offset.vertical),size};
    NSAttributedString *texts = [NSAttributedString attributedStringWithAttachment:attachment];
    
    [self.jfAttributeText insertAttributedString:texts atIndex:location];
    
}
/** 直接设置样式，不会导致界面UI变化，需要手动调用更新 */
-(void)updateLabelStyle{
    
    
    
    
    
    
}













@end
