//
//  UIImage+Category.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/6.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "UIImage+Category.h"
#import <objc/runtime.h>

/**
 *  屏幕尺寸宽和高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

static CGFloat iPhoneXHeight = 812;

@implementation UIImage (Category)

+ (UIImage *)JZ_imageNamed:(NSString *)name{
    //假如iPhoneX的话 图片适配
    if (kScreenHeight == iPhoneXHeight) {
         name = @"NewMyBill_回款-01@2x";
    }
    
    return [UIImage JZ_imageNamed:name];
}

+ (void)load{
    
    Method method1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method method2 = class_getClassMethod([UIImage class], @selector(JZ_imageNamed:));
    
    method_exchangeImplementations(method1, method2);
}

@end
