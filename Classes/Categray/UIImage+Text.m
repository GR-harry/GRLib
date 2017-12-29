//
//  UIImage+Text.m
//  TextImage
//
//  Created by GR on 2017/12/4.
//  Copyright © 2017年 Harry. All rights reserved.
//

#import "UIImage+Text.h"

@implementation UIImage (Text)

+ (UIImage *)imageWitText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    return [self imageWitText:text size:CGSizeMake(180, 180) style:style textColor:textColor font:font];
}

+ (UIImage *)imageWitText:(NSString *)text size:(CGSize)size style:(NSParagraphStyle *)style textColor:(UIColor *)textColor font:(UIFont *)font
{
    UIColor *color = [self randomColor];  //获取随机颜色
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *headerName = nil;
    if (text.length < 3) {
        headerName = text;
    }else{
        headerName = [text substringFromIndex:text.length - 2];
    }
    
    UIImage *headerimg = [self imageToAddText:img withText:headerName style:style textColor:textColor font:font];
    return headerimg;
}

//随机颜色
+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

//把文字绘制到图片上
+ (UIImage *)imageToAddText:(UIImage *)img withText:(NSString *)text style:(NSParagraphStyle *)style textColor:(UIColor *)textColor font:(UIFont *)font
{
    //1.获取上下文
    UIGraphicsBeginImageContext(img.size);
    //2.绘制图片
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    //3.绘制文字
    CGRect rect = CGRectMake(0,(img.size.height - font.lineHeight) / 2, img.size.width, font.lineHeight);
    //文字的属性
    NSDictionary *dic = @{NSFontAttributeName : font, NSParagraphStyleAttributeName : style, NSForegroundColorAttributeName : textColor};
    //将文字绘制上去
    [text drawInRect:rect withAttributes:dic];
    //4.获取绘制到得图片
    UIImage *watermarkImg = UIGraphicsGetImageFromCurrentImageContext();
    //5.结束图片的绘制
    UIGraphicsEndImageContext();
    
    return watermarkImg;
}


@end
