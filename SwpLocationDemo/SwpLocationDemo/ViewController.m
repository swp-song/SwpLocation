//
//  ViewController.m
//  SwpLocationDemo
//
//  Created by swp_song on 2017/11/1.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "ViewController.h"


#import <SwpLocation/SwpLocationHeader.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *locationAddressView;
@property (nonatomic, weak) IBOutlet UILabel *locationGCJ02View;
@property (nonatomic, weak) IBOutlet UILabel *locationBD09View;

@end

@implementation ViewController

//  Privacy - Location Always and When In Use Usage Description : 我们需要通过您的地理位置信息获取您周边的相关数据
//  Privacy - Location Always Usage Description                 : 我们需要通过您的地理位置信息获取您周边的相关数据
//  Privacy - Location When In Use Usage Description            : 使用应用期间

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.locationAddressView sizeToFit];
    
    [self.locationGCJ02View sizeToFit];
    
    [self.locationBD09View sizeToFit];
    
    
    __weak typeof(self) weakSelf = self;
    //  初始化
    SwpLocation.shareInstanceInit()
    //  打开定位
    .swpLocationOpenChain()
    //  定位失败回调
    .swpLocationErrorChain(^(SwpLocation *swpLocation, NSError *error){
        NSLog(@"%@", error);
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.locationAddressView.text = @"定位失败 !";
    })
    //  定位成功，获取定位信息回调
    .swpLocationReverseGeocodeChain(^(SwpLocation *swpLocation, SwpLocationModel *model, NSError *error){
        __strong typeof(self) strongSelf = weakSelf;
        NSLog(@"%@", model.locationAddress);
        strongSelf.locationAddressView.text = model.locationAddress;
        
        NSString *GCJ02 =  [NSString stringWithFormat:@"GCJ02坐标系 < 火星坐标 > ：%@,%@", model.longitudeGCJ02, model.latitudeGCJ02];
        strongSelf.locationGCJ02View.text = GCJ02;
        NSLog(@"%@", GCJ02);
        
        NSString *BD09 = [NSString stringWithFormat:@"BD09坐标系 < 百度坐标 > ：%@,%@", model.longitudeBD09, model.latitudeBD09];
        strongSelf.locationBD09View.text = BD09;
        NSLog(@"%@", BD09);
    });
    
    //  http://api.map.baidu.com/lbsapi/getpoint/index.html 百度坐标拾取器，翻查坐标
    //  http://lbs.amap.com/console/show/picker             高德坐标拾取器，按坐标搜索
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
