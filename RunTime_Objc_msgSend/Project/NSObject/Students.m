//
//  Students.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/21.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "Students.h"

@implementation Students

- (instancetype)init{
    if (self = [super init]) {
        [self StudentsRun];
        
    }
    return self;
}

- (void)StudentsRun{
    NSLog(@"Students run");
}

@end
