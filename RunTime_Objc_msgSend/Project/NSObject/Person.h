//
//  Person.h
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/5.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject

+ (void)goHome;

- (void)goSchool;

@end
