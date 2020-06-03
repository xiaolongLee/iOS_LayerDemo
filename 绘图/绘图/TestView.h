//
//  TestView.h
//  绘图
//
//  Created by yuanshi on 2020/4/22.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestView : UIView

@property (nonatomic,assign) int kl;

@property (nonatomic,assign) CGFloat px;

@property (nonatomic,assign) CGFloat py;

@property (nonatomic,assign) CGFloat pxStart;

@property (nonatomic,assign) CGFloat pyStart;

@property (nonatomic,strong) UIBezierPath *drawPath;

@property (nonatomic,strong) NSMutableArray *pathsArray;

@property (nonatomic,strong) NSMutableArray *shapeLayersArray;

- (void)allSelectedLayer;

@end

NS_ASSUME_NONNULL_END
