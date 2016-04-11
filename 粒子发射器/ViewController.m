//
//  ViewController.m
//  粒子发射器
//
//  Created by 清溪 on 16/4/11.
//  Copyright © 2016年 清溪. All rights reserved.


/*
 1.粒子发送器图层
 CAEmitterLayer:发送器
 每秒发送粒子数量:birthRate
 发送形状的样式:emitterShape
 CA_EXTERN NSString * const kCAEmitterLayerPoint  点
 CA_EXTERN NSString * const kCAEmitterLayerLine   线
 CA_EXTERN NSString * const kCAEmitterLayerRectangle  举行
 CA_EXTERN NSString * const kCAEmitterLayerCuboid 立方体
 CA_EXTERN NSString * const kCAEmitterLayerCircle 曲线
 CA_EXTERN NSString * const kCAEmitterLayerSphere 圆形
 
 
 发送的样式:emitterMode   //120行开始
 CA_EXTERN NSString * const kCAEmitterLayerPoints以点的方式  默认样式
 CA_EXTERN NSString * const kCAEmitterLayerOutline线的样式
 CA_EXTERN NSString * const kCAEmitterLayerSurface  以面的形式
 CA_EXTERN NSString * const kCAEmitterLayerVolume    以团的样式
 粒子出现的样式:renderMode//点进去第129行开始
 CA_EXTERN NSString * const kCAEmitterLayerOldestFirst最后一个出生的粒子在第一个
 CA_EXTERN NSString * const kCAEmitterLayerOldestLast最后出生的就在最后一个
 CA_EXTERN NSString * const kCAEmitterLayerBackToFront把后面的放到上面
 CA_EXTERN NSString * const kCAEmitterLayerAdditive叠加效果
 在粒子发送器上面添加粒子:emitterCells
 表示粒子的是:CAEmitterCell  他不是一个Layer
 contents:粒子的内容
 lifetime:存活时间
 lifetimeRange:存活时间的范围
 birthRate:每秒的粒子生成的数量
 emissionLatitude:散发的维度  他表示的是一个弧度   上下
 emissionLongitude:散发的经度  ->弧度   ->左右
 velocity:发送的速度   速度越快发送的越远->动力
 velocityRange:发送速度的范围
 xAcceleration;  x，y，z轴的加速度  惯性  动力
 yAcceleration;
 zAcceleration;
 emissionRange:散发的范围  ->弧度  ->范围
 name:粒子的名字  可以通过名字  找到粒子

 */

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic ,strong)CAEmitterLayer *emitterLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    self.emitterLayer.frame = CGRectMake(200, 250, 200, 200);
    //    self.emitterLayer.frame = self.view.bounds;
    //    position是layer中心点，   emitterPosition是粒子的中心点
    self.emitterLayer.emitterPosition = self.view.center;
    //    self.emitterLayer.backgroundColor = [UIColor blackColor].CGColor;
    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"花瓣堆"];
    //    [self.view addSubview:imageView];
    
    //设置粒子发送器每秒钟发送粒子数量
    self.emitterLayer.birthRate = 2;
    //设置粒子发送器的样式
    self.emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id)[UIImage imageNamed:@"星星"].CGImage;
    CAEmitterCell *cell2 = [CAEmitterCell emitterCell];
    cell2.contents = (id)[UIImage imageNamed:@"点"].CGImage;
    CAEmitterCell *cell1 = [CAEmitterCell emitterCell];
    cell1.contents = (id)[UIImage imageNamed:@"星星"].CGImage;
    cell1.birthRate = 1;
    cell1.lifetime = 3;
    cell1.lifetimeRange = 2;
    cell1.velocity = 30;
    cell1.velocityRange = 20;
    cell1.emissionLongitude = 180*M_PI;
    cell1.yAcceleration = 100;
    cell1.emissionRange = 180*M_PI/180;
    
    //    粒子的出生量
    cell.birthRate = 2;
    //    存活时间
    cell.lifetime = 3;
    cell.lifetimeRange = 1;
    //    设置粒子发送速度
    cell.velocity = 50;
    cell.velocityRange = 30;
    //    粒子发送的方向
    cell.emissionLatitude = 90*M_PI/180;
    //    发送粒子的加速度
    cell.yAcceleration = -100;
    
    //    散发粒子的范围  ->  弧度
    cell.emissionRange = 180*M_PI/180;
    
    
    
    //    粒子的出生量
    cell2.birthRate = 4;
    //    存活时间
    cell2.lifetime = 3;
    cell2.lifetimeRange = 1;
    //    设置粒子发送速度
    cell2.velocity = 80;
    cell2.velocityRange = 50;
    //    粒子发送的方向
    cell2.emissionLatitude = 90*M_PI/180;
    //    发送粒子的加速度
    cell2.yAcceleration = -100;
    
    //    散发粒子的范围  ->  弧度
    cell2.emissionRange = 180*M_PI/180;
    
    //把粒子的cell添加到粒子发送器
    self.emitterLayer.emitterCells = @[cell,cell1,cell2];
    
}

- (CAEmitterLayer *)emitterLayer{
    if (_emitterLayer) {
        return _emitterLayer;
    }
    _emitterLayer = [[CAEmitterLayer alloc]init];
    [self.view.layer addSublayer:_emitterLayer];
    //    _emitterLayer.position = CGPointMake(200, 200);
    _emitterLayer.backgroundColor = [UIColor blackColor].CGColor;
    return _emitterLayer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end