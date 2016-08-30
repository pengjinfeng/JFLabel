//
//  JFLabel.h
//  JFLabel
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 pengjf. All rights reserved.
//

#define degree(d) (M_PI * d / 180.0f)
#import <UIKit/UIKit.h>
#import "JFTextAttachment.h"
typedef NS_ENUM(NSInteger,JFLabelAttribute){
    //颜色
    JFLabelAttributeColor = 0,
    //字体大小
    JFLabelAttributeFont,
    //斜体
    JFLabelAttributeObliqueness,
    //字间距
    JFLabelAttributeKern,
    //删除线
    JFLabelAttributeDeleteLine,
    //下划线
    JFLabelAttributeUnderLine,
    
};


@interface JFLabel : UILabel
//行间距
@property (nonatomic,assign)CGFloat lineSpace;
//首行缩进
@property (nonatomic,assign)CGFloat headIndentSpace;
//段落间距
@property (nonatomic,assign)CGFloat paragaraphSpace;


- (void)addJFLabelAttribute:(JFLabelAttribute)attrStyle value:(nonnull id)value range:(NSRange)range;

-(void)addImage:(nonnull UIImage *)image size:(CGSize)size offset:(UIOffset)offset location:(NSUInteger)location;

@end
