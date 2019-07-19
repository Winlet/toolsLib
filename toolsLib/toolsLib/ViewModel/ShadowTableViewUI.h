//
//  ShadowTableViewUI.h
//  toolsLib
//
//  Created by uinpay on 2019/7/19.
//  Copyright © 2019 刘起伏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMGroupShadowTableView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ProjectUIDelegate <NSObject>


/**
 点击事件

 @param indexPath cell的位置
 */
- (void)didSelectTableRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 配置cell
可自定义cell
 */
- (void)configCellWith:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

@end

@interface ShadowTableViewUI : NSObject<RMGroupShadowTableViewDelegate,RMGroupShadowTableViewDataSource>


/**
 数据列表
 */
@property(nonatomic,strong) NSArray * dataArray;
@property(nonatomic,assign) NSInteger heightForRow;
//代理
@property (nonatomic, weak) id <ProjectUIDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
