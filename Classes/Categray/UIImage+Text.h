//
//  UIImage+Text.h
//  TextImage
//
//  Created by GR on 2017/12/4.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Text)

/**
 用 string 生成一张图片

 @param text 文字
 @param size 图片大小
 @param style 段落样式
 @param textColor 文字颜色
 @param font 文字字体
 @return 图片
 */
+ (UIImage *)imageWitText:(NSString *)text size:(CGSize)size style:(NSParagraphStyle *)style textColor:(UIColor *)textColor font:(UIFont *)font;


/**
 用 string 生成一张图片

 @param text 文字
 @param textColor 颜色
 @param font 字体
 @return 图片
 */
+ (UIImage *)imageWitText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;
@end
