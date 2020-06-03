//
//  VideoView.m
//  绘图
//
//  Created by yuanshi on 2020/4/22.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "VideoView.h"

@implementation VideoView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    _isMoved = false;//在本程序中，设置这个参数的目的是为了让虚线框适时消失
    _touch =  [touches anyObject] ;
     _startPoint = [_touch locationInView:self];//记录起始点，point是声明为全局变量
//    [_segControl removeFromSuperview];
     [self setNeedsDisplay];   //重绘界面，目的在于让虚线框消失
}

//手指移动过程
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
    _isMoved = true;
    _endPoint=[_touch locationInView:self];//记录结束点的坐标
    
    // 用结束点的坐标减去起始点的坐标我么得到一个矩形框的宽和高,声明一个点记录一下；
    _finalPoint.x=_endPoint.x-_startPoint.x;
    _finalPoint.y=_endPoint.y-_startPoint.y;
    // 调用重绘方法,setNeedsDisplay中会自动调用drawRect:,我们不能自己调用drawRect:
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
    _endPoint = [_touch locationInView:self];//记录起始点，point是声明为全局变量
    if(_isMoved){
//        _segControl.frame = CGRectMake(endPoint.x-50,endPoint.y+5,100,35);
//        [self addSubview:_segControl];
    }
    _isMoved = false;
   
}

//当接收到系统中断时，这些方法都不是自己调用的
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled");
}

//准备工作做好后，我们就要画虚线的矩形框了.我们需要重写drawRect方法。完整代码如下：
- (void)drawRect:(CGRect)rect//这个rect参数是这个view在一个cotroller中的位置
{
    NSLog(@"drawRect called ,%f %f %f %f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    if(_isMoved == true){
        //获取绘图上下文-画板
        CGContextRef ref=UIGraphicsGetCurrentContext();
        //边框
           CGContextSetLineWidth(ref, 1.0);
           CGContextSetStrokeColorWithColor(ref, [UIColor brownColor].CGColor);
        //设置虚线
//        CGFloat lengths[] = {10,10};
//        CGContextSetLineDash(ref,2, lengths, 1);
        //画截取线框
        CGContextAddRect(ref,CGRectMake(_startPoint.x,_startPoint.y,_finalPoint.x,_finalPoint.y));
        //设置颜色
        CGContextSetStrokeColorWithColor(ref,[UIColor redColor].CGColor);
        //设置线宽
        CGContextSetLineWidth(ref,1);
        CGContextStrokePath(ref);
        

    }

}

@end
