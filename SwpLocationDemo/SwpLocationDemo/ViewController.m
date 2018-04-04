//
//  ViewController.m
//  SwpLocationDemo
//
//  Created by swp_song on 2018/3/27.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import <SwpLocation/SwpLocationHeader.h>

@interface ViewController ()


@property (nonatomic, weak) IBOutlet UILabel *locationAddressView;
@property (nonatomic, weak) IBOutlet UILabel *locationGCJ02View;
@property (nonatomic, weak) IBOutlet UILabel *locationBD09View;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  Privacy - Location Always and When In Use Usage Description : 我们需要通过您的地理位置信息获取您周边的相关数据
    //  Privacy - Location Always Usage Description                 : 我们需要通过您的地理位置信息获取您周边的相关数据
    //  Privacy - Location When In Use Usage Description            : 使用应用期间
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.locationAddressView sizeToFit];
    
    [self.locationGCJ02View sizeToFit];
    
    [self.locationBD09View sizeToFit];
    
    
    
    NSLog(@"SwpLocationInfo     = %@", SwpLocation.shareInstanceInit().swpLocationInfo);
    NSLog(@"SwpLocationVersion  = %@", SwpLocation.shareInstanceInit().swpLocationVersion);
    
    __weak typeof(self) weakSelf = self;
    //  初始化
    SwpLocation.shareInstanceInit()
    .swpLocationMode(SwpLocationRequestAlwaysAuthorization)
    //  打开定位
    .swpLocationOpenChain()
    //  定位失败回调
    .swpLocationErrorChain(^(SwpLocation *swpLocation, NSError *error){
        NSLog(@"%@", error);
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.locationAddressView.text = @"定位失败 !";
    })
    //  定位成功，获取定位信息回调
    .swpLocationReverseGeocodeChain(^(SwpLocation *swpLocation, SwpLocationModel *model, NSError *error){
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        {
            
            NSLog(@"%@", model.locationAddress);
            strongSelf.locationAddressView.text = model.locationAddress;
            
            NSString *GCJ02 =  [NSString stringWithFormat:@"GCJ02坐标系 < 火星坐标 > ：%@,%@", model.longitudeGCJ02, model.latitudeGCJ02];
            strongSelf.locationGCJ02View.text = GCJ02;
            NSLog(@"%@", GCJ02);
            
            NSString *BD09 = [NSString stringWithFormat:@"BD09坐标系 < 百度坐标 > ：%@,%@", model.longitudeBD09, model.latitudeBD09];
            strongSelf.locationBD09View.text = BD09;
            NSLog(@"%@", BD09);
        }
        
        {
        
            SwpLocationCoordinate2D GCJ02_0 = SwpLocationCoordinate2DMake(model.latitudeGCJ02.doubleValue, model.longitudeGCJ02.doubleValue);
            NSLog(@"GCJ02_0 = %f,%f", GCJ02_0.longitude, GCJ02_0.latitude);
            SwpLocationCoordinate2D WGS84_0 = SwpLocationCoordinateUtilsGCJ02ToWGS84(GCJ02_0.latitude, GCJ02_0.longitude);
            NSLog(@"WGS84_0 = %f,%f", WGS84_0.longitude, WGS84_0.latitude);
            SwpLocationCoordinate2D GCJ02_1 = SwpLocationCoordinateUtilsWGS84ToGCJ02(WGS84_0.latitude, WGS84_0.longitude);
            NSLog(@"GCJ02_1 = %f,%f", GCJ02_1.longitude, GCJ02_1.latitude);
            
            SwpLocationCoordinate2D DB_90_0 = SwpLocationCoordinate2DMake(model.latitudeBD09.doubleValue, model.longitudeBD09.doubleValue);
            NSLog(@"DB_90_0 = %f,%f", DB_90_0.longitude, DB_90_0.latitude);
            SwpLocationCoordinate2D WGS84_1 = SwpLocationCoordinateUtilsBD09ToWGS84(DB_90_0.latitude, DB_90_0.longitude);
            NSLog(@"WGS84_1 = %f,%f", WGS84_1.longitude, WGS84_1.latitude);
            SwpLocationCoordinate2D DB_90_1 = SwpLocationCoordinateUtilsWGS84ToBD09(WGS84_1.latitude, WGS84_1.longitude);
            NSLog(@"DB_90_1 = %f,%f", DB_90_1.longitude, DB_90_1.latitude);

        }
        
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
