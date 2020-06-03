//
//  ViewController.m
//  绘图
//
//  Created by yuanshi on 2020/4/22.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "ViewController.h"
#import "VideoView.h"
#import "TestView.h"
@interface ViewController ()
@property (nonatomic,strong) VideoView *videoView;
@property (nonatomic,strong) TestView *testView;
@property (nonatomic,assign) int k;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.videoView];
    
    [self.view addSubview:self.testView];
    NSArray *titleArr = @[@"清理",@"全选",@"确定"];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(30 + i *100, 400, 100, 44);
        [self.view addSubview:btn];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        btn.tag = 3500 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
//    [self.view setNeedsDisplay];
}

- (VideoView *)videoView {
    
    if (!_videoView) {
        _videoView = [[VideoView alloc] initWithFrame:CGRectMake(30, 100, 200, 200)];
        _videoView.backgroundColor = [UIColor yellowColor];
    }
    return _videoView;
}

- (TestView *)testView {
    if (!_testView) {
        _testView = [[TestView alloc] initWithFrame:CGRectMake(30, 100, 300, 300)];
        _testView.backgroundColor = [UIColor clearColor];
    }
    return _testView;
}

- (void)btnClick:(UIButton *)btn {
    switch (btn.tag) {
        case 3500:
        {
            // 最后一个删不掉
            for (CAShapeLayer *sl in _testView.shapeLayersArray) {
                    // 将每条已画的线删除
                    [sl removeFromSuperlayer];

            }

            [_testView.shapeLayersArray removeAllObjects];
            [_testView.pathsArray removeAllObjects];
            
            
            // 没反应
//            [_testView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
            
             // 崩溃了
//                _testView.layer.sublayers = nil;
//               [_testView.layer removeFromSuperlayer];
            
            
               
        }
            
            break;
        case 3501:
        {
            [_testView allSelectedLayer];
        }
                
            break;
        case 3502:
        {
            
        }
            
            break;
            
        default:
            break;
    }
}
@end
