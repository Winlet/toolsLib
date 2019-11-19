//
//  LQFRadioButton.m
//  toolsLib
//
//  Created by uinpay on 2019/9/3.
//  Copyright © 2019 刘起伏. All rights reserved.
//

#import "LQFRadioButton.h"
// radio button 的宽高
#define kRadioButtonWidth 22
#define kRadioButtonHeight 22

@implementation LQFRadioButton

-(instancetype)init{
    if (self = [super init])
    {
        
        self.index = 0;
        self.isHorizontal = YES;
        self.spacing = 10;
        self.showTextFont = [UIFont systemFontOfSize:10];
        self.showTextColor = [UIColor blackColor];
    }
    return self;
}

-(void)setShowTextArray:(NSArray *)showTextArray
{
    _showTextArray = showTextArray;
    
    [self initUI];
}

#pragma mark - 初始化UI
- (void) initUI
{
        NSUInteger showTextCount = [self.showTextArray count]; // 显示的个数
        NSMutableArray *btnList = [NSMutableArray array];
        for(int i = 0; i< showTextCount; i++)
        {
            //TODO: 间距是已button 为间距，没有已button和文字为整体做为间距，这里没做处理
            
            UIButton *button = [UIButton new];
            [button setImage:[UIImage imageNamed:@"RadioButton-Unselected"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateSelected];
            button.tag = i + 1;
            if (self.index == i ) {
                button.selected = YES;
            }
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [button setTitle:self.showTextArray[i] forState:UIControlStateNormal];
            [button setTitleColor:self.showTextColor forState:UIControlStateNormal];
            button.titleLabel.font = self.showTextFont;
        
            [self addSubview:button];
            [btnList addObject:button];
            
        }
        if (self.isHorizontal) {
        //水平方向控件间隔固定等间隔
//        [btnList mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:2 tailSpacing:5];
//        [btnList mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.bottom.mas_equalTo(0);
//        }];
        }else{
            
            //垂直方向控件间隔固定等间隔
//            [btnList mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:15 leadSpacing:2 tailSpacing:5];
//            [btnList mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.right.mas_equalTo(0);
//            }];
        }
}


#pragma mark - 点击事件
- (void)buttonClick:(UIButton *)btn
{
    for (UIButton *button in self.subviews)
    {
        if ([button isKindOfClass:[UIButton class]]) {
            button.selected = NO;
        }
    }
    
    btn.selected = YES;
    
    // block
    if (self.radioCheckBoxBlock) {
        
        // 隐藏的数组 必须和showTextArray 保持一致，否则会崩溃
        if (self.hideTextArray && [self.hideTextArray count] > 0) {
            self.radioCheckBoxBlock(btn.tag - 1, self.showTextArray[btn.tag -1], self.hideTextArray[btn.tag - 1]);
        }
        else
        {
            self.radioCheckBoxBlock(btn.tag - 1, self.showTextArray[btn.tag -1], @"");
        }
    }
    
    
}



#pragma mark - 方法
//获取字符的宽度，在水平排列时，需要获得
//- (CGFloat) getStringWidth:(NSString *)aString andFont:(UIFont*) font
//{
//    CGSize stringSize = [aString sizeWithFont:font]; // 规定字符字体获取字符串Size，再获取其宽度。
//    CGFloat width = stringSize.width;
//    return width;
//}

#pragma mark - block 方法
- (void) radioCheckBoxClick:(RadioCheckBoxBlock)block
{
    self.radioCheckBoxBlock = block;
}


@end
