//
//  YWWaterFlowLayout.h
//  puBuLiu
//
//  Created by jhyw12 on 2017/8/31.
//  Copyright © 2017年 jhyw12fulankeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWWaterFlowLayout;
@protocol YWWaterFlowLayoutDelegate <NSObject>
- (CGFloat)waterFlowLayout:(YWWaterFlowLayout *)layout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width;
@required


@end

@interface YWWaterFlowLayout : UICollectionViewLayout
@property (nonatomic, weak) id<YWWaterFlowLayoutDelegate> delegate;
@end
