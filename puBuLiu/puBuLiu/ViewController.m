//
//  ViewController.m
//  puBuLiu
//
//  Created by jhyw12 on 2017/8/31.
//  Copyright © 2017年 jhyw12fulankeji. All rights reserved.
//

#import "ViewController.h"
#import "YWWaterFlowLayout.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate, YWWaterFlowLayoutDelegate>

@end

@implementation ViewController

static NSString * const cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    YWWaterFlowLayout *layout = [[YWWaterFlowLayout alloc] init];
    layout.delegate = self;
    UICollectionView *collectV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [collectV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
    collectV.dataSource = self;
    collectV.delegate = self;
    collectV.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:collectV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGFloat)waterFlowLayout:(YWWaterFlowLayout *)layout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width{
    return  50 + arc4random_uniform(100);
}




@end
