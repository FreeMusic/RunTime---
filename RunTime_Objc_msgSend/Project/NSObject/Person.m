//
//  Person.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/5.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)goHome{
    NSLog(@"goHome");
}
/**
 *   动态解析类方法
 */
+ (BOOL)resolveClassMethod:(SEL)sel{
    if (sel == @selector(goHome)) {
        class_addMethod(object_getClass(self), sel, class_getMethodImplementation(object_getClass(self), sel), "V@");
    }
    
    return [class_getSuperclass(self) resolveClassMethod:sel];
}

- (void)goSchool{
    NSLog(@"goSchool");
}
/**
 *  动态解析实例方法
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(goSchool)) {
        class_addMethod([self class], sel, class_getMethodImplementation([self class], @selector(goSchool)), "V@");
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
