//
//  toolsLib.h
//  toolsLib
//
//  Created by uinpay on 2019/7/19.
//  Copyright © 2019 刘起伏. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 归档的实现
 */
#define NSCoding \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self mj_decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self mj_encode:encoder]; \
}

@interface toolsLib : NSObject

//获取日期 yyyy-M-d
@property (nonatomic,strong) NSMutableArray *yearMDArray;

@end
