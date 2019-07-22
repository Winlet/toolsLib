//
//  toolsLib.m
//  toolsLib
//
//  Created by uinpay on 2019/7/19.
//  Copyright © 2019 刘起伏. All rights reserved.
//

#import "toolsLib.h"

@implementation toolsLib

-(NSMutableArray *)yearMDArray{
    if (!_yearMDArray) {
        _yearMDArray = [NSMutableArray array];
        NSDate *date = [NSDate date];
        NSDateFormatter *f = [[NSDateFormatter alloc]init];
        [f setDateFormat:@"yyyy"];
        NSString *year = [f stringFromDate:date];
        [f setDateFormat:@"M"];
        NSString *month = [f stringFromDate:date];
        [f setDateFormat:@"d"];
        NSString *day = [f stringFromDate:date];
        
        for (int i = year.intValue; i>2000; i--) {
            NSMutableDictionary *yearDic = [NSMutableDictionary dictionary];
            NSMutableArray *monthArr = [NSMutableArray array];
            for (int j = 1; j<=12; j++) {
                if (i == year.intValue && j >month.intValue) {
                    break;
                }
                NSMutableDictionary *monthDic = [NSMutableDictionary dictionary];
                long days = [self getDaysInYear:i month:j];
                NSMutableArray *dayArray = [NSMutableArray array];
                for (int k = 1; k<=days; k++) {
                    if (i == year.intValue && j == month.intValue && k>day.intValue) {
                        break;
                    }
                    [dayArray addObject:[@(k) stringValue]];
                }
                [monthDic setObject:dayArray forKey:[@(j) stringValue]];
                [monthArr addObject:monthDic];
            }
            [yearDic setObject:monthArr forKey:[@(i) stringValue]];
            [_yearMDArray addObject:yearDic];
        }
    }
    return _yearMDArray;
}

// 获取某年某月总共多少天
- (NSInteger)getDaysInYear:(NSInteger)year month:(NSInteger)imonth {
    // imonth == 0的情况是应对在CourseViewController里month-1的情况
    if((imonth == 0)||(imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12))
        return 31;
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11))
        return 30;
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0)
        return 29;
    if(year%100 == 0)
        return 28;
    return 29;
}

@end
