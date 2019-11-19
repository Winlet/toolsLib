//
//  LQFRadioButton.h
//  toolsLib
//
//  Created by uinpay on 2019/9/3.
//  Copyright © 2019 刘起伏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *  单选控件
 
 LQFRadioButton *radioCheckBox = [[LQFRadioButton alloc] init];
 radioCheckBox.isHorizontal = NO; //默认
 radioCheckBox.spacing = 50; //默认 10
 radioCheckBox.index = 0; // 默认 0
 radioCheckBox.showTextFont = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
 // 可选项，需保持和showTextArray 一致
 radioCheckBox.hideTextArray = [NSArray arrayWithObjects:@"1",@"2", nil];
 radioCheckBox.showTextArray = [NSArray arrayWithObjects:@"长期",@"有效期",nil];
 [radioCheckBox radioCheckBoxClick:^(NSUInteger index, NSString *showText, NSString *hideText) {
 
 NSLog(@"index----->%lu------>%@------>%@",(unsigned long)index,showText,hideText);
 }];
 
 [self.view addSubview:radioCheckBox];
 [radioCheckBox mas_makeConstraints:^(MASConstraintMaker *make) {
 make.left.equalTo(self.view.mas_left).offset(35);
 make.top.mas_equalTo(200);
 make.right.bottom.mas_equalTo(0);
 }];
 
 */

/**
 *  block 方法
 *
 *  @param index    当前选中的index
 *  @param showText 显示的文字（UI 可看见）
 *  @param hideText 隐藏的文字（需求上有可能真正可见的字段，不定是需要的）
 *
 *
 */
typedef void (^RadioCheckBoxBlock)(NSUInteger index, NSString *showText, NSString *hideText);

@interface LQFRadioButton : UIView

@property(nonatomic, assign) NSUInteger index; // 默认选中的位置（默认0）
@property(nonatomic, retain) NSArray *showTextArray; // 显示的数据，UI可见（必选）
@property(nonatomic, retain) NSArray *hideTextArray; // 隐藏的数据，根据需求可选,如果选择，请求保持和showTextArray数组个数保持一致,
@property(nonatomic, assign) BOOL isHorizontal; // YES 水平方向显示(默认)， NO 纵向
@property(nonatomic, assign) float spacing; // 每个item 的间距 默认 10.0

@property(nonatomic, retain) UIFont *showTextFont; // 显示字体的大小 默认 10
@property(nonatomic, retain) UIColor *showTextColor; // 显示字体的颜色 默认 black

//block
@property(nonatomic, copy) RadioCheckBoxBlock radioCheckBoxBlock;
- (void) radioCheckBoxClick: (RadioCheckBoxBlock) block;

@end

NS_ASSUME_NONNULL_END
