//
//  YWWaterFlowLayout.m
//  puBuLiu
//
//  Created by jhyw12 on 2017/8/31.
//  Copyright © 2017年 jhyw12fulankeji. All rights reserved.
//

#import "YWWaterFlowLayout.h"

static NSUInteger cols = 2;
static CGFloat rowMargin = 10;
static CGFloat colMargin = 20;
static UIEdgeInsets inset = {10,20,30,40};



@interface YWWaterFlowLayout()
@property (nonatomic, strong) NSMutableArray *allAttrs;
@property (nonatomic, strong) NSMutableArray *allHeight;

@end

@implementation YWWaterFlowLayout


- (NSMutableArray *)allAttrs {
    if (!_allAttrs) {
        _allAttrs = [NSMutableArray array];
    }
    
    return _allAttrs;
}

- (NSMutableArray *)allHeight {
    if (!_allHeight) {
        _allHeight = [NSMutableArray array];
    }
    
    return _allHeight;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.allAttrs removeAllObjects];
    [self.allHeight removeAllObjects];
    for (int i=0; i<cols; i++) {
        [self.allHeight addObject:@(inset.top)];
    }

    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.allAttrs addObject:attrs];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.allAttrs;
}

- (CGSize)collectionViewContentSize {
    CGFloat maxHeight = [self.allHeight[0] doubleValue];
    for (int i=1; i<cols; i++) {
        if (maxHeight < [self.allHeight[i] doubleValue]) {
            maxHeight = [self.allHeight[i] doubleValue];
        }
    }
    return CGSizeMake(0, maxHeight + inset.bottom - rowMargin);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    // 设置布局属性的frame
    CGFloat w = (collectionViewW - inset.left - inset.right - (cols - 1) * colMargin) / cols;
    CGFloat h = [self.delegate waterFlowLayout:self heightForItemAtIndex:indexPath.item width:w];
    CGFloat x = 0;
    CGFloat y = 0;
    // 最短的那一列
    NSInteger minHeightCol = 0;
    CGFloat minColHeight = [self.allHeight[minHeightCol] doubleValue];
    for (int i=1; i<cols; i++) {
        if (minColHeight > [self.allHeight[i] doubleValue]) {
            minColHeight = [self.allHeight[i] doubleValue];
            minHeightCol = i;
        }
    }
    

    self.allHeight[minHeightCol] = @(minColHeight + rowMargin + h);
    
    
    x = inset.left + minHeightCol*(w+colMargin);
    y = minColHeight;

    attrs.frame = CGRectMake(x, y, w, h);
    
    return attrs;
}

@end
