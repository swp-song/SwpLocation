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
        NSLog(@"%@", model.locationAddress);
        strongSelf.locationAddressView.text = model.locationAddress;
        
        NSString *GCJ02 =  [NSString stringWithFormat:@"GCJ02坐标系 < 火星坐标 > ：%@,%@", model.longitudeGCJ02, model.latitudeGCJ02];
        strongSelf.locationGCJ02View.text = GCJ02;
        NSLog(@"%@", GCJ02);
        
        NSString *BD09 = [NSString stringWithFormat:@"BD09坐标系 < 百度坐标 > ：%@,%@", model.longitudeBD09, model.latitudeBD09];
        strongSelf.locationBD09View.text = BD09;
        NSLog(@"%@", BD09);
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
