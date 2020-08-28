//
//  EPYMerchantCardViewController.m
//  EasyPay
//
//  Created by uinpay on 2020/4/22.
//  Copyright © 2020 com.easypay. All rights reserved.
//

#import "EPYMerchantCardViewController.h"
#import "EPYCollectionLayout.h"
#import "EPYHomeReusableView.h"

@interface EPYMerchantCardViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewLayoutDelegate>

@property (nonatomic,strong) UICollectionView * collectionView;

@end

@implementation EPYMerchantCardViewController

//+(instancetype)viewClass{
//    EPYCheckingView *v = [[[NSBundle mainBundle] loadNibNamed:@"EPYCheckingView" owner:self options:nil] lastObject];
//    v.backgroundColor = [UIColorFromRGB(0x333333) colorWithAlphaComponent:0.7];
//    return v;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - CollectionViewLayoutDelegate
- (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(375, 375 * 31 / 75);
            break;
        case 1:
            return CGSizeMake(375, 35);
            break;
        default:
            return CGSizeMake((375-2)/3, 375/3*0.75);
            break;
    }
}
- (CGSize)sectionHeaderSize:(NSInteger)section
{
    
    return CGSizeZero;
}

- (CGSize)sectionFooterSize:(NSInteger)section
{
    return CGSizeZero;
}

- (CGFloat)sectionPadding:(NSInteger)section{
    
    return 0;
}

- (CGFloat)customItemHorizontalPaddingForIndexPath:(NSIndexPath *)indexPath{
    
    return 0;
}

- (CGFloat)customItemVerticalPaddingForIndexPath:(NSIndexPath *)indexPath{

    return 0;
    
}

- (void)collectionViewMoreThanOneScreen:(BOOL)isMore {
    if (isMore) {
        //TODO: show something
    }
}


#pragma mark - lazy
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        EPYCollectionLayout *flowLayout = [EPYCollectionLayout new];
        flowLayout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        // 背景颜色
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];

        [_collectionView registerNib:[UINib nibWithNibName:@"EPYHomeReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"EPYHomeReusableViewReuseId"];
    }
    return _collectionView;
}


@end
