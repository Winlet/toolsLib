//
//  UILongPressLabel.m
//  Demo
//
//  Created by uinpay on 2019/11/7.
//  Copyright © 2019 uinpay. All rights reserved.
//

#import "UILongPressLabel.h"
#import "EPYNetworkManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation UILongPressLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //让label能够响应用户的交互
        self.userInteractionEnabled = YES;
        
        //给label添加手势
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] init];
        //设置长按最少需要2s
        longPressGesture.minimumPressDuration = 2;
        //添加长按响应事件
        [longPressGesture addTarget:self action:@selector(longPressAction:)];
        //添加手势
        [self addGestureRecognizer:longPressGesture];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    //让label能够响应用户的交互
    self.userInteractionEnabled = YES;
    
    //给label添加手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] init];

    //添加长按响应事件
    [longPressGesture addTarget:self action:@selector(longPressAction:)];
    //添加手势
    [self addGestureRecognizer:longPressGesture];
}

//长按手势事件
- (void)longPressAction:(UILongPressGestureRecognizer *)longPressGes
{
    //让label成为第一响应者
    [self becomeFirstResponder];
    //长按label时展示出复制选项(还可以定义剪贴,粘贴)
    //创建UIMenuController
    UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyAction)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:copyItem]];
    //设置frame和添加到的视图
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    //设置弹窗可见
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}

//copy按钮点击事件
- (void)copyAction
{
    //将label上的字符串保存到 UIPasteboard 上
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.text;
}

#pragma mark  --  UIResponder
//本来UIlabel是不能成为响应者的,在这里重写方法
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
//控制响应的方法
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return action == @selector(copyAction);
}

@end
