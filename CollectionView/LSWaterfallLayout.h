//
//  LSWaterfallLayout.h
//  CollectionView
//
//  Created by Marshal on 2017/10/16.
//  Copyright © 2017年 Marshal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSWaterfallLayout;

//瀑布流的协议
@protocol LSWaterfallLayoutDelegate <NSObject>

@required
//返回高度的数组必须实现
- (CGFloat)waterfallLayout:(LSWaterfallLayout *)waterfallLayout indexPath:(NSIndexPath *)indexPath;

@end

@interface LSWaterfallLayout : UICollectionViewLayout

@property (nonatomic, weak) id<LSWaterfallLayoutDelegate> delegate;

@property (nonatomic, assign) NSInteger columCount;//列数

@property (nonatomic, assign) CGFloat columnMargin;//列间距

@property (nonatomic, assign) CGFloat rowMargin;//行间距

@property (nonatomic, assign) UIEdgeInsets edgInsets;//边缘间距

@end

