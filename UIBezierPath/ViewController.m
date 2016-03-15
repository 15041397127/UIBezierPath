//
//  ViewController.m
//  UIBezierPath
//
//  Created by ZhangXu on 16/3/15.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"
@interface ViewController ()
@property (nonatomic ,strong)CAShapeLayer *loadingLayer;
@property (nonatomic ,strong)NSTimer *timer;
@property (nonatomic ,strong)NSArray *animationTypes;
@property (nonatomic ,assign)NSUInteger index;
@property (nonatomic ,strong)BezierPathView *pathView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout =UIRectEdgeNone;
    
//    [self addBezierPath];
    
    [self drawHalfCircle];
//      [self drawCircle];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)drawHalfCircle{
    
    self.loadingLayer = [self drawCircle];
    // 这个是用于指定画笔的开始与结束点
    self.loadingLayer.strokeStart = 0.0 ;
    self.loadingLayer.strokeEnd = 0.75;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateCircle) userInfo:nil repeats:YES];
 
}

-(void)updateCircle{
    
    if (self.loadingLayer.strokeEnd >1 && self.loadingLayer.strokeStart <1) {
        self.loadingLayer.strokeStart += 0.1;
    }else if (self.loadingLayer.strokeStart ==0){
        self.loadingLayer.strokeEnd += 0.1;
    }
    
    if (self.loadingLayer.strokeStart >= 1 && self.loadingLayer.strokeEnd >= 1) {
        self.loadingLayer.strokeStart = 0;
        [self.timer invalidate];
        self.timer = nil;
    }
    
    
}

-(CAShapeLayer *)drawCircle{
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    
    //指定frame 只是为了设置宽度和高度
    circleLayer.frame = CGRectMake(0, 0, 250, 250);
    
    //设置居中显示
    circleLayer.position = self.view.center;
    
    //设置填充颜色
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    
    //设置线宽
    circleLayer.lineWidth = 1.0;
    
    //设置画线颜色
    
    circleLayer.strokeColor = [UIColor cyanColor].CGColor;
    
    //使用UIBezierPath创建路径
    CGRect frame  = CGRectMake(0 , 0, 250, 250);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];
    
   // 设置CAShapeLayer与UIBezierPath关联
    circleLayer.path = circlePath.CGPath;
    
    // 将CAShaperLayer放到某个层上显示
    [self.view.layer addSublayer:circleLayer];
    
    
    return circleLayer;
}


-(void)addBezierPath{
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    BezierPathView *view = [[BezierPathView alloc]initWithFrame:CGRectMake(0, 100, kwidth, height-140-64)];
    [self.view addSubview:view];
    
    view.layer.borderColor = [UIColor purpleColor].CGColor;
    view.layer.borderWidth = 5;
    view.backgroundColor = [UIColor whiteColor];
    
    view.type = kDefaultPath;
    self.index = 0;
    
    self.animationTypes = @[@(kDefaultPath),
                            @(kRectPah),
                            @(kCirclePath),
                            @(kOvalPath),
                            @(kRoudedRectPath),
                            @(kArcPath),
                            @(kSecondBezierPath),
                            @(kThirdBezierPath),];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateType) userInfo:nil repeats:YES];
    
    self.view.layer.borderWidth =1;
    self.view.layer.borderColor = [UIColor redColor].CGColor;
    self.pathView = view;
    
    
}

- (void)updateType{
    
    if (self.index +1<self.animationTypes.count) {
        self.index ++;
        
    }else{
        
        self.index = 0;
    }
    
    self.pathView.type = [[self.animationTypes objectAtIndex:self.index]intValue];
    
    [self.pathView setNeedsDisplay];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
