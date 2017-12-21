//
//  MyClass.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/5.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self showTimeWithTime:@"2:30"];
        
    }
    
    return self;
}

- (void)showTimeWithTime:(NSString *)time{
    NSLog(@"showTime");
}

+ (void)run{
    NSLog(@"run");
}

+ (void)study{
    NSLog(@"study");
}

@end
