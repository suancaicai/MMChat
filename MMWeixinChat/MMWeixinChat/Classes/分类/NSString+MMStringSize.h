//
//  NSString+MMStringSize.h
//  MMProject
//
//  Created by yumingming on 16/4/14.
//  Copyright © 2016年 MM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (MMStringSize)
/**
 *  计算字符串的范围
 *
 *  @param font     字体大小
 *  @param maxWidth 最大宽度
 *
 *  @return size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;



- (NSString *) pinyin;
- (NSString *) pinyinInitial;
@end
