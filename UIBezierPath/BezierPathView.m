//
//  BezierPathView.m
//  UIBezierPath
//
//  Created by ZhangXu on 16/3/15.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

-(void)drawRect:(CGRect)rect{
    
    switch (self.type) {
        case kDefaultPath:
           [self drawTrianglePath];
            break;
        case kRectPah:
            [self drawRectPath];
            break;
        case kCirclePath:
            [self drawCiclePath];
            break;
        case kOvalPath:
            [self drawOvalPath];
            break;
        case kRoudedRectPath:
            [self drawRoundedRectPath];
            break;
        case kArcPath:
            [self drawARCPath];
            break;
        case kSecondBezierPath:
            [self drawSecondBezierPath];
            break;
        case kThirdBezierPath:
            [self drawThirdBezierPath];
            break;
            
        default:
            break;
    }
 
}

//画三角形

-(void)drawTrianglePath{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(ScreenWitdth-40, 20)];
    [path addLineToPoint:CGPointMake(ScreenWitdth/2, ScreenHeight-20)];
    
    //最后的闭合线是可以通过调用closePath方法自动生成的 ,也可以调用 addLinePoint:方法添加
    
    //  [path addLineToPoint:CGPointMake(20, 20)];

    [path closePath];
    path.lineWidth = 1.5;
    
    //设置填充色
    UIColor *fillColor = [UIColor cyanColor];
    [fillColor set];
    [path fill];
    //设置画笔颜色
    UIColor *strokeColor = [UIColor greenColor];
    [strokeColor set];
    
    
    //根据我们设置的各个点连线
    [path stroke];
  
}

//画矩形
-(void)drawRectPath{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, ScreenWitdth-40, ScreenHeight-40)];
    
    path.lineWidth = 1.5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinBevel;
    
    //设置填充色
    UIColor *fillColor = [UIColor redColor];
    [fillColor set];
    [path fill];
    
    //设置画笔颜色
    
    UIColor *strokeColor = [UIColor cyanColor];
    [strokeColor set];
    
    [path stroke];
    
    
    
}
//画圆
-(void)drawCiclePath{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, ScreenWitdth-40, ScreenWitdth-40)];
    
    UIColor *fillColor = [UIColor cyanColor];
    [fillColor set];
    [path fill];
    
    UIColor *strokeColor = [UIColor  greenColor];
    [strokeColor set];
    
    [path stroke];
}

//画椭圆
-(void)drawOvalPath{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, ScreenWitdth-80, ScreenHeight-40)];
    
    UIColor *fillColor = [UIColor grayColor];
    [fillColor set];
    [path fill];
    
    UIColor *strokeColor = [UIColor greenColor];
    [strokeColor set];
    
    [path stroke];
    
}

//带圆角的矩形
-(void)drawRoundedRectPath{
    //  UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) cornerRadius:10];
    
//    如果要画只有一个角是圆角，那么我们就修改创建方法：
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];

    
    
    
//    其中第一个参数一样是传了个矩形，第二个参数是指定在哪个方向画圆角，第三个参数是一个CGSize类型，用来指定水平和垂直方向的半径的大小。看下效果
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, ScreenWitdth - 40, ScreenHeight-40) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(20, 20)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor cyanColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor greenColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
    
    
}

//画弧
#define kDegreesToTadians(degrees)  ((pi * degrees)/180)
-(void)drawARCPath{
    
    const CGFloat pi = M_PI;
    CGPoint center = CGPointMake(ScreenWitdth/2, ScreenHeight/2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:kDegreesToTadians(135) clockwise:YES];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor cyanColor];
    [strokeColor set];
    
    [path stroke];
    
}

//画二次贝塞尔曲线

-(void)drawSecondBezierPath{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //首先设置一个起始点
    [path moveToPoint:CGPointMake(20, ScreenHeight-100)];
    
    //添加二次曲线
    [path addQuadCurveToPoint:CGPointMake(ScreenWitdth-20, ScreenHeight-100) controlPoint:CGPointMake(ScreenWitdth/2, 0)];
    path.lineCapStyle =kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor * strokeColor = [UIColor cyanColor];
    [strokeColor set];
    [path stroke];
    
  
}

//画三次贝塞尔曲线
-(void)drawThirdBezierPath{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置起始端点
    [path moveToPoint:CGPointMake(20, 150)];
    
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(160, 0) controlPoint2:CGPointMake(160, 250)];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor cyanColor];
    [strokeColor set];
    
    [path stroke];
    

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
