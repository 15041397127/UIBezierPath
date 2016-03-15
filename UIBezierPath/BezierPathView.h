//
//  BezierPathView.h
//  UIBezierPath
//
//  Created by ZhangXu on 16/3/15.
//  Copyright © 2016年 zhangXu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger , ZXBezierPathType){
    kDefaultPath = 1, // 三角形
    kRectPah = 2,//矩形
    kCirclePath = 3, //圆
    kOvalPath = 4, // 椭圆
    kRoudedRectPath = 5, //带椭圆的矩形
    kArcPath = 6, // 弧
    kSecondBezierPath = 7, // 二次贝塞尔曲线
    kThirdBezierPath = 8 // 三次贝塞尔曲线
};
@interface BezierPathView : UIView
@property (nonatomic ,assign)ZXBezierPathType type;
@end
