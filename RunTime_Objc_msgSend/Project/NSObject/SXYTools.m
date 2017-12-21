//
//  SXYTools.m
//  RunTime_Objc_msgSend
//
//  Created by mic on 2017/12/11.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "SXYTools.h"
#import <objc/runtime.h>

//获取屏幕宽度的宏
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)

static const void *kTextField = "textField";

@implementation SXYTools

#pragma 增加隐藏键盘按钮
+ (void)hideKeyBoard:(UITextField *)textFiled{
    //为键盘增加工具栏
    UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(ScreenWidth-60, 0, 50, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(ScreenWidth-60, 5, 50, 25);
    
    //将textFiled绑定到button上
    objc_setAssociatedObject(btn, kTextField, textFiled, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [btn addTarget:self action:@selector(dismissKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
    [topView setItems:buttonsArray];
    [textFiled setInputAccessoryView:topView];
}

+ (void)dismissKeyBoard:(UIButton *)button{
    //获取button上对应的值
    [objc_getAssociatedObject(button, kTextField) resignFirstResponder];
}

@end
