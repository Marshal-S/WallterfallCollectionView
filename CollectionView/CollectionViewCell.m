//
//  CollectionViewCell.m
//  CollectionView
//
//  Created by Marshal on 2017/10/18.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 140, 40)];
        _lable.textColor = [UIColor blackColor];
        _lable.textAlignment = NSTextAlignmentCenter;
        _lable.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_lable];
    }
    return self;
}

@end
