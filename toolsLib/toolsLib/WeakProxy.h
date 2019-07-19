//
//  WeakProxy.h
//  toolsLib
//
//  Created by uinpay on 2019/7/19.
//  Copyright © 2019 刘起伏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSProxy

+(instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
