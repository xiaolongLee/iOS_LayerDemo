//
//  VideoView.h
//  绘图
//
//  Created by yuanshi on 2020/4/22.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoView : UIView
@property (nonatomic,assign) BOOL isMoved;

@property (nonatomic,strong) UITouch *touch;

@property (nonatomic,assign) CGPoint  startPoint;

@property (nonatomic,assign) CGPoint endPoint;

@property (nonatomic,assign) CGPoint  finalPoint;
@end

NS_ASSUME_NONNULL_END
