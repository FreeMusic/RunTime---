//
//  ViewController.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/5.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"
#import "Person.h"
#import "NSObject+Category.h"
#import "UIView+Category.h"
#import "UIButton+Category.h"
#import "SXYTools.h"

#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.color = [UIColor redColor];
    self.view.backgroundColor = [UIColor grayColor];
    //利用runTime实现方法执行是顺序的交换  不是同一个类也可以
    [self exchangeMethodExecutionSequence];
    //拦截系统的方法
    [self interceptSystemMethod];
    //在分类中设置属性  给任何一个对象设置属性
    [self setPropertyWithCategory];
}
/**
 *  利用runTime实现方法执行是顺序的交换  不是同一个类也可以
 */
- (void)exchangeMethodExecutionSequence{
    //MyClass *myClass = [[MyClass alloc] init];
    
    Method method1 = class_getClassMethod([MyClass class], @selector(run));
    
    //Method method2 = class_getClassMethod([MyClass class], @selector(study));
    
    Method method3 =class_getClassMethod([Person class], @selector(goHome));
    
    method_exchangeImplementations(method1, method3);
    
    [MyClass run];
    
    [Person goHome];
    
    [[[Person alloc] init] goSchool];
    
    //[MyClass study];
}
/**
 *  拦截系统的方法
 */
- (void)interceptSystemMethod{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NewMyBill_其他@2x"]];
    imageView.frame = CGRectMake(100, 100, 43, 43);
    [self.view addSubview:imageView];
}
/**
 *  在分类中设置属性  给任何一个对象设置属性
 */
- (void)setPropertyWithCategory{
    
    NSObject *jc = [[NSObject alloc] init];
    
    jc.name = @"100";
    
    NSLog(@"%@", jc.name);
    
    UIButton *btn = [UIButton ButtonWithTitle:@"离开" shapeType:ButtonShapeTypeWithSolid open:YES addSubView:self.view buttonActionBlock:^(UIButton *button) {
        NSLog(@"这是真的离开了");
    }];
    btn.frame = CGRectMake(50, 200, ScreenWidth-100, 50);
    
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(15, 150, ScreenWidth-30, 30)];
    textFiled.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textFiled];
    [SXYTools hideKeyBoard:textFiled];
    
    UIButton *button = [UIButton buttonWithType:0];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction{
    
}

@end
