//
//  SwpLocationType.h
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>   // 系统定位框架


NS_ASSUME_NONNULL_BEGIN

@interface SwpLocationType : NSObject
/**
 - kSwpLocationAuthorizedStatus                         定位权限
 - kSwpLocationAuthorizedStatusNotDetermined:           用户从未选择过权限, 第一次申请定位权限, 等待用户授权
 - kSwpLocationAuthorizedStatusRestricted:              无法使用定位服务，该状态用户无法改变
 - kSwpLocationAuthorizedStatusDenied:                  无法使用定位服务, 用户关闭定位权限
 - kSwpLocationAuthorizedStatusAuthorizedAlways:        用户允许程序使用定位权限, 该程序无论何时都可以使用定位
 - kSwpLocationAuthorizedStatusAuthorizedWhenInUse:     用户允许程序使用定位权限，改程序运行时可以使用定位
 */
typedef NS_ENUM(int, SwpLocationAuthorizedStatus) {
    kSwpLocationAuthorizedStatusNotDetermined       = kCLAuthorizationStatusNotDetermined,
    kSwpLocationAuthorizedStatusRestricted          = kCLAuthorizationStatusRestricted,
    kSwpLocationAuthorizedStatusDenied              = kCLAuthorizationStatusDenied,
    kSwpLocationAuthorizedStatusAuthorizedAlways    = kCLAuthorizationStatusAuthorizedAlways,
    kSwpLocationAuthorizedStatusAuthorizedWhenInUse = kCLAuthorizationStatusAuthorizedWhenInUse,
};

/**
 - SwpLocationMode
 - SwpLocationRequestWhenInUseAuthorization:
 - SwpLocationRequestAlwaysAuthorization:
 */
typedef NS_ENUM(NSInteger, SwpLocationMode) {
    
    SwpLocationRequestWhenInUseAuthorization,
    SwpLocationRequestAlwaysAuthorization,
};


@end
NS_ASSUME_NONNULL_END
