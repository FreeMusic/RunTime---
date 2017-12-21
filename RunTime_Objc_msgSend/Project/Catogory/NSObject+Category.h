//
//  NSObject+Category.h
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/6.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)
/**
 *  声明出set get 方法 方便点语法调用
 */
@property (nonatomic, strong) NSString *name;

@end
