//
//  TestView.m
//  绘图
//
//  Created by yuanshi on 2020/4/22.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc ] initWithTarget:self action:@selector(move:)];
        [self addGestureRecognizer:pan];
        self.pathsArray = [NSMutableArray array];
        self.shapeLayersArray  = [NSMutableArray array];
        [self allSelectedLayer];
    }
    return self;
}
 
 
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat x = MIN(self.pxStart, self.px);
      CGFloat y = MIN(self.pyStart, self.py);
//    if ([self.drawPath containsPoint:CGPointMake(x, y)]) {
//          return;
//      }
      CGFloat width = fabs(self.px - self.pxStart);
      CGFloat height = fabs(self.py - self.pyStart);
         UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
      
  
    path.lineWidth =2;
    
    UIColor *color = [UIColor orangeColor];
    [color set]; //划线颜色
    
    [path stroke];   //画线
    self.drawPath = path;
}
 
//@property(nonatomic,readonly) CGRect bounds;
//@property(nonatomic,readonly) CGPoint currentPoint;
//- (BOOL)containsPoint:(CGPoint)point;

- (void)addPath {
    CAShapeLayer *lay = [[CAShapeLayer alloc] init];
    lay.path = self.drawPath.CGPath;
    lay.lineWidth = 2;
    lay.fillColor = [UIColor clearColor].CGColor;
    lay.strokeColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:lay];
    [self.shapeLayersArray  addObject:lay];
    [self.pathsArray addObject:self.drawPath];
}


- (void)allSelectedLayer {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    path.lineWidth =2;
    UIColor *color = [UIColor orangeColor];
    [color set]; //划线颜色
    [path stroke];   //画线
    CAShapeLayer *lay = [[CAShapeLayer alloc] init];
    lay.path = path.CGPath;
    lay.lineWidth = 2;
   lay.fillColor = [UIColor clearColor].CGColor;
   lay.strokeColor = [UIColor orangeColor].CGColor;
   [self.layer addSublayer:lay];
   [self.shapeLayersArray  addObject:lay];
   [self.pathsArray addObject:path];
    
}

- (void)move:(UIPanGestureRecognizer *)gesture {
    UIGestureRecognizerState state = gesture.state;
    if (self.pathsArray.count >= 4) {
        NSLog(@"最多选择四个区域");
        return;
    }
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"UIGestureRecognizerStateBegan");
            self.pxStart = [gesture locationInView:self].x; // 获取到的是手指点击屏幕实时的坐标点；
            self.pyStart = [gesture locationInView:self].y;
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"UIGestureRecognizerStateEnded");
            [self addPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint translation = [gesture locationInView:self];
            self.px = translation.x;
            self.py = translation.y;
             [self setNeedsDisplay];
            
        }
            break;
            
        default:
            break;
    }
    
}

@end
