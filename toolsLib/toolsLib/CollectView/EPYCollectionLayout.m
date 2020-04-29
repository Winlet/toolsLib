//
//  EPYCollectionLayout.m
//  EasyPay_New
//
//  Created by uinpay on 2019/8/29.
//  Copyright © 2019 unipay. All rights reserved.
//

#import "EPYCollectionLayout.h"

@interface EPYCollectionLayout()

@property (nonatomic, strong) NSMutableArray *attributesArr;
@property (nonatomic, assign) CGPoint lastPoint;

@end

@implementation EPYCollectionLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.lastPoint = CGPointZero;
    self.attributesArr = [NSMutableArray array];
    
    NSUInteger sectionCount = [self.collectionView numberOfSections];
    
    for (NSInteger index = 0; index < sectionCount; index++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:index];
        UICollectionViewLayoutAttributes *headerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:index]];
        if (headerAttr) {
            [self.attributesArr addObject:headerAttr];
        }
        for (int i =0; i < itemCount; i++) {
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:index]];
            [self.attributesArr addObject:attributes];
        }
        
        UICollectionViewLayoutAttributes *lastAttributes = self.attributesArr.lastObject;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
        self.lastPoint = CGPointMake(0, lastAttributes.frame.size.height +lastAttributes.frame.origin.y +[self itemVerticalPaddingIndexPath:indexPath]);
        
        UICollectionViewLayoutAttributes *footerAttr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:[NSIndexPath indexPathForItem:1 inSection:index]];
        if (footerAttr) {
            [self.attributesArr addObject:footerAttr];
        }
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(collectionViewMoreThanOneScreen:)]) {
        [self.delegate collectionViewMoreThanOneScreen:(self.lastPoint.y > 600)];
        //(SCREENHEIGHT-TopHeight-TabBarHeight) <--> 600
    }
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.lastPoint.y);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [self.attributesArr filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
    }]];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    CGFloat height = 0.f;
    CGFloat padding = 0.f;
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        padding = [self.delegate sectionPadding:indexPath.section];
        height = [self.delegate sectionHeaderSize:indexPath.section].height;
    } else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]) {
        height = [self.delegate sectionFooterSize:indexPath.section].height;
    }
    if (height > 0.f) {
        attributes.frame = CGRectMake(0,padding + self.lastPoint.y, self.collectionView.frame.size.width, height);
        self.lastPoint = CGPointMake(0,padding + self.lastPoint.y + height);
        return attributes;
    }
    return nil;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat itemVerticalPadding = [self itemVerticalPaddingIndexPath:indexPath];
    CGFloat itemHorizontalPadding = [self itemHorizontalPaddingIndex:indexPath];
    CGSize itemSize = [self.delegate itemSizeForIndexPath:indexPath];
    CGFloat itemWidth = itemSize.width;
    CGFloat itemHeight = itemSize.height;
    
    if (self.lastPoint.x +itemHorizontalPadding +itemWidth > self.collectionView.frame.size.width) {
        UICollectionViewLayoutAttributes *lastAttributes = self.attributesArr.lastObject;
        self.lastPoint = CGPointMake(0, lastAttributes.frame.size.height +lastAttributes.frame.origin.y);
    }
    
    CGRect rect = CGRectMake(self.lastPoint.x +itemHorizontalPadding, self.lastPoint.y +itemVerticalPadding, itemWidth, itemHeight);
    attributes.frame = rect;
    self.lastPoint = CGPointMake(rect.origin.x +rect.size.width, self.lastPoint.y);
    
    return attributes;
}

- (CGFloat)itemHorizontalPaddingIndex:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(customItemHorizontalPaddingForIndexPath:)])
        return [self.delegate customItemHorizontalPaddingForIndexPath:indexPath];
    return 10;
    
}

- (CGFloat)itemVerticalPaddingIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(customItemVerticalPaddingForIndexPath:)])
        return [self.delegate customItemVerticalPaddingForIndexPath:indexPath];
    return 10;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

@end
