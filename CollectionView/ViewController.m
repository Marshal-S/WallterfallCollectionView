//
//  ViewController.m
//  CollectionView
//
//  Created by Marshal on 2017/10/16.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "ViewController.h"
#import "LSWaterfallLayout.h"
#import "CollectionViewCell.h"
#import <Foundation/Foundation.h>

NSString * const kLSIndentifier = @"LSIndentifier";

@interface ViewController ()<LSWaterfallLayoutDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *_heightList;
}

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _heightList = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 40; idx++) {
        [_heightList addObject:@((rand()%100 + 50)/100)];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    LSWaterfallLayout *waterfallLayout = [[LSWaterfallLayout alloc] init];
    waterfallLayout.delegate = self;
    waterfallLayout.edgInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:waterfallLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:kLSIndentifier];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    
    [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [_heightList insertObject:@((rand()%100 + 40)/100) atIndex:0];
        [self.collectionView reloadData];
    }];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _heightList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kLSIndentifier forIndexPath:indexPath];
    cell.lable.text = [NSString stringWithFormat:@"我是第%ld个",indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGFloat)waterfallLayout:(LSWaterfallLayout *)waterfallLayout indexPath:(NSIndexPath *)indexPath {
    return [_heightList[indexPath.row] floatValue] * (self.view.frame.size.width/2 - 20) + 40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
