//
//  NSObject+Category.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/6.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>
/**
 *  重写set get方法 内部用runtime给属性赋值取值
 */
@implementation NSObject (Category)

char nameKey;

-(void)setName:(NSString *)name{
    /**
     *  set方法 将值value跟对象object关联起来 （将值value存储
     *  到对象object中）
     *  Object 即给哪个属性赋值
     *  key:一个属性对应一个key 将来可以通过key取出这个存储的值，key可以是任意类型 double int 等，建议使用char节省字节
     *  参数value 给属性设置的值
     *  参数policy: 存储属性 ，系统枚举了一下几个（assign, copy, strong(retain)）：
            OBJC_ASSOCIATION_ASSIGN = 0
            OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1
            OBJC_ASSOCIATION_COPY_NONATOMIC = 3
            OBJC_ASSOCIATION_RETAIN = 01401
            OBJC_ASSOCIATION_COPY = 01403
     */
    //objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, objc_AssociationPolicy policy)
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (NSString *)name{
    
    return objc_getAssociatedObject(self, &nameKey);
    
}

@end
