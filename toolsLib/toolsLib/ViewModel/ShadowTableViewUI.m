//
//  ShadowTableViewUI.m
//  toolsLib
//
//  Created by uinpay on 2019/7/19.
//  Copyright © 2019 刘起伏. All rights reserved.
//

#import "ShadowTableViewUI.h"

@implementation ShadowTableViewUI

-(UITableViewCell *)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (self.dataArray.count) {
        id temp = [self.dataArray objectAtIndex:indexPath.section];
        if ([temp isKindOfClass:[NSString class]]) {
            cell.textLabel.text = temp;
        }else if ([temp isKindOfClass:[NSDictionary class]]){
            NSString *key =  [((NSDictionary *)temp).allKeys objectAtIndex:0];
            cell.textLabel.text = key;
            cell.detailTextLabel.text = [temp objectForKey:key];
        }
    }

    [self configCellWith:cell indexPath:indexPath];
    return cell;
}

- (void)configCellWith:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(configCellWith:indexPath:)]) {
        [self.delegate configCellWith:cell indexPath:indexPath];
        return;
    }
    cell.detailTextLabel.textAlignment = NSTextAlignmentRight;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    
}
-(NSInteger)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInRMGroupShadowTableView:(RMGroupShadowTableView *)tableView{
    return self.dataArray.count;
}
- (CGFloat)RMGroupShadowTableViewForFooterInTabel:(UITableView *)table heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.heightForRow;
}

- (void)RMGroupShadowTableView:(RMGroupShadowTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectTableRowAtIndexPath:)]) {
        [self.delegate didSelectTableRowAtIndexPath:indexPath];
    }
}

@end
