//
//  UIViewController+Category.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/11.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>

char colorKey;

@implementation UIView (Category)

- (void)setColor:(UIColor *)color{
    objc_setAssociatedObject(self, &colorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)color{
    
    return objc_getAssociatedObject(self, &colorKey);
}

@end
