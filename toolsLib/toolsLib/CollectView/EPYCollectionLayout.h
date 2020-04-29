//
//  EPYCollectionLayout.h
//  EasyPay_New
//
//  Created by uinpay on 2019/8/29.
//  Copyright © 2019 unipay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CollectionViewLayoutDelegate <NSObject>

- (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)customItemHorizontalPaddingForIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)customItemVerticalPaddingForIndexPath:(NSIndexPath *)indexPath;
- (CGSize)sectionHeaderSize:(NSInteger)section;
- (CGSize)sectionFooterSize:(NSInteger)section;

- (CGFloat)sectionPadding:(NSInteger)section;

- (void)collectionViewMoreThanOneScreen:(BOOL)isMore;

@end

@interface EPYCollectionLayout : UICollectionViewLayout

@property (nonatomic, weak) id <CollectionViewLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
