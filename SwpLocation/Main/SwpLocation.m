//
//  SwpLocation.m
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpLocation.h"

@import UIKit;

#import "SwpLocationModel.h"
#import "SwpLocationTools.h"
#import "SwpLocationCoordinateTransformation.h"

@interface SwpLocation() <CLLocationManagerDelegate>

#pragma mark - Data Propertys
/* 定位信息管理者 */
@property (nonatomic, strong) CLLocationManager *locationManager;
/* 地理编码对象 */
@property (nonatomic, strong) CLGeocoder        *geocoder;

/* SwpLocation 回调方法，获取定位权限，定位权限发生改变时调用  */
@property (nonatomic, copy, setter = swpLocationDidChangeAuthorizationStatus:) void(^swpLocationDidChangeAuthorizationStatus)(SwpLocation *, SwpLocationAuthorizedStatus);
/* SwpLocation 回调方法，定位成功调用  */
@property (nonatomic, copy, setter = swpLocationSuccess:) void(^swpLocationSuccess)(SwpLocation *, NSArray *);
/* SwpLocation 回调方法，反地理编码调用  */
@property (nonatomic, copy, setter = swpLocationReverseGeocode:) void(^swpLocationReverseGeocode)(SwpLocation *, SwpLocationModel *, NSError *);
/* SwpLocation 回调方法，反地理编码调用  */
@property (nonatomic, copy, setter = swpLocationError:) void(^swpLocationError)(SwpLocation *, NSError *);


@end

@implementation SwpLocation


/**
 *  @author swp_song
 *
 *  @brief  init    ( Override init )
 *
 *  @return id
 */
- (instancetype)init {
    
    if (self = [super init]) {

        
    }
    return self;
    
}

#pragma mark - CLLocationManager Delegate
/**
 *  @author swp_song
 *
 *  @brief  locationManager:didChangeAuthorizationStatus: ( CLLocationManager 代理方法，获取定位权限，定位权限发生改变时调用 )
 *
 *  @param  manager manager
 *
 *  @param  status  status
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    switch (status) {
            
        case kCLAuthorizationStatusNotDetermined:
            break;
        case kCLAuthorizationStatusRestricted:
            break;
        case kCLAuthorizationStatusDenied:
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            [self swpLocationStart];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self swpLocationStart];
            break;
        default:
            break;
    }
    
    
    if (self.swpLocationDidChangeAuthorizationStatus) self.swpLocationDidChangeAuthorizationStatus(self, (int)status);
        
    if ([self.delegate_ respondsToSelector:@selector(swpLocation:swpLocationDidChangeAuthorizationStatus:)]) {
        [self.delegate_ swpLocation:self swpLocationDidChangeAuthorizationStatus:(int)status];
    }
}

/**
 *  @author swp_song
 *
 *  @brief  locationManager:didUpdateLocations: ( CLLocationManager 代理方法，定位成功，获取到定位信息就回调用 )
 *
 *  @param  manager     manager
 *
 *  @param  locations   locations
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    
    // 停止定位
    self.swpLocationStopChain();
    
    // 定位成功
    if (self.swpLocationSuccess) self.swpLocationSuccess(self, locations);
    
    if ([self.delegate_ respondsToSelector:@selector(swpLocation:locationSuccess:)]) {
        [self.delegate_ swpLocation:self locationSuccess:locations];
    }
    
    
    CLLocation *location = (CLLocation *)locations.lastObject;
    __weak typeof(self) weakSelf = self;
    
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        __strong typeof(self) strongSelf = weakSelf;
        
        CLPlacemark *placemark = (CLPlacemark *)placemarks.firstObject;
        
        //  取出，火星坐标系 (GCJ-02)
        CLLocationCoordinate2D  coordinateGCJ02 = placemark.location.coordinate;
        //  坐标转换，火星坐标系 (GCJ-02) -> 百度坐标系 (BD-09)
        SwpLocationCoordinate2D coordinateBD09  = [SwpLocationCoordinateTransformation swpLocationGCJ02ToBD09:coordinateGCJ02.latitude longitude:coordinateGCJ02.longitude];
        
        //  包装解析数据
        NSDictionary *dictionary = [SwpLocationTools swpLocationToolsPackagingData:placemark latitudeGCJ02:@(coordinateGCJ02.latitude) longitudeGCJ02:@(coordinateGCJ02.longitude) latitudeBD09:@(coordinateBD09.latitude) longitudeBD09:@(coordinateBD09.longitude)];
        
        //  解析数据
        SwpLocationModel *swpLocation = [SwpLocationModel swpLocationWithDictionary:dictionary];
        
        if (strongSelf.swpLocationReverseGeocode) strongSelf.swpLocationReverseGeocode(strongSelf, swpLocation, error);
        
        if ([strongSelf.delegate_ respondsToSelector:@selector(swpLocation:reverseGeocodeLocation:error:)]) {
            [strongSelf.delegate_ swpLocation:strongSelf reverseGeocodeLocation:swpLocation error:error];
        }
        
    }];
    
}

/**
 *  @author swp_song
 *
 *  @brief  locationManager:didFailWithError:   ( CLLocationManager 代理方法，定位失败时调用 )
 *
 *  @param  manager manager
 *
 *  @param  error   error
 */
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    if (self.swpLocationError) self.swpLocationError(self, error);
    
    if ([self.delegate_ respondsToSelector:@selector(swpLocation:locationError:)]) {
        [self.delegate_ swpLocation:self locationError:error];
    }
}





#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  shareInstanceInit   ( 单利 )
 */
+ (__kindof SwpLocation * _Nonnull (^)(void))shareInstanceInit {
    
    return ^(void) {
        return [self.class shareInstance];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationOpen ( 打开定位 )
 */
- (void)swpLocationOpen {
    
    if (UIDevice.currentDevice.systemVersion.floatValue >= 8) {
        //  [self.swpLocationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
    
    // 5.iOS9新特性：将允许出现这种场景：同一app中多个location manager：一些只能在前台定位，另一些可在后台定位（并可随时禁止其后台定位）。
    if (UIDevice.currentDevice.systemVersion.floatValue >= 9) {
        
        //  self.locationManager.allowsBackgroundLocationUpdates = YES;
    }
    

    
    self.swpLocationStartChain();
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationOpenChain    ( 打开定位 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void))swpLocationOpenChain {
    
    return ^(void) {
        [self swpLocationOpen];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationStart    ( 开启定位 )
 */
- (void)swpLocationStart {
    [self.locationManager startUpdatingLocation];
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationStartChain   ( 开启定位 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void))swpLocationStartChain {
    
    return ^(void) {
        [self swpLocationStart];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpStartLocation    ( 停止定位 )
 */
- (void)swpLocationStop {
    [self.locationManager stopUpdatingLocation];
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationStartChain   ( 停止定位 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void))swpLocationStopChain {
    
    return ^(void) {
        [self swpLocationStop];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  setDelegate:    ( 设置代理 )
 *
 *  @param  delegate_   delegate
 */
- (void)setDelegate_:(id<SwpLocationDelegate>)delegate_ {
    _delegate_ = delegate_;
}

/**
 *  @author swp_song
 *
 *  @brief  delegate    ( 设置代理 )
 */
- (__kindof SwpLocation * _Nonnull (^)(id<SwpLocationDelegate>))delegate {
    return ^(id<SwpLocationDelegate>delegate) {
        [self setDelegate_:delegate];
        return self;
    };
}

#pragma makr -

/**
 *  @author swp_song
 *
 *  @brief  swpLocationDidChangeAuthorizationStatus:    ( SwpLocation 回调方法，获取定位权限，定位权限发生改变时调用 )
 *
 *  @param  swpLocationDidChangeAuthorizationStatus swpLocationDidChangeAuthorizationStatus
 */
- (void)swpLocationDidChangeAuthorizationStatus:(void (^)(SwpLocation * _Nonnull, SwpLocationAuthorizedStatus))swpLocationDidChangeAuthorizationStatus {
    _swpLocationDidChangeAuthorizationStatus = swpLocationDidChangeAuthorizationStatus;
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationDidChangeAuthorizationStatusChain    ( SwpLocation 回调方法，获取定位权限，定位权限发生改变时调用 )
 */
- (SwpLocation * _Nonnull (^)(void (^)(SwpLocation * _Nonnull, SwpLocationAuthorizedStatus)))swpLocationDidChangeAuthorizationStatusChain {
    
    return ^(void(^swpLocationDidChangeAuthorizationStatus)(SwpLocation *swpLocation, SwpLocationAuthorizedStatus status)) {
        _swpLocationDidChangeAuthorizationStatus = swpLocationDidChangeAuthorizationStatus;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpLocationSuccess: ( SwpLocation 回调方法，定位成功调用 )
 *
 *  @param  swpLocationSuccess  swpLocationSuccess
 */
- (void)swpLocationSuccess:(void (^)(SwpLocation * _Nonnull, NSArray * _Nonnull))swpLocationSuccess {
    _swpLocationSuccess = swpLocationSuccess;
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationSuccessChain ( SwpLocation 回调方法，定位成功调用 )
 */
- (SwpLocation * _Nonnull (^)(void (^)(SwpLocation * _Nonnull, NSArray * _Nonnull)))swpLocationSuccessChain {
    
    return ^(void(^swpLocationSuccess)(SwpLocation *swpLocation, NSArray *locations)) {
        _swpLocationSuccess = swpLocationSuccess;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationError:   ( SwpLocation 回调方法，定位失败调用 )
 *
 *  @param  swpLocationError    swpLocationError
 */
- (void)swpLocationError:(void (^)(SwpLocation * _Nonnull, NSError * _Nonnull))swpLocationError {
    _swpLocationError = swpLocationError;
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationErrorChain   ( SwpLocation 回调方法，定位失败调用 )
 */
- (SwpLocation * _Nonnull (^)(void (^)(SwpLocation * _Nonnull, NSError * _Nonnull)))swpLocationErrorChain {
    return ^(void(^swpLocationError)(SwpLocation *swpLocation, NSError *error)) {
        _swpLocationError = swpLocationError;
        return self;
    };
}



/**
 *  @author swp_song
 *
 *  @brief  swpLocationReverseGeocode:  ( SwpLocation 回调方法，反地理编码调用 )
 *
 *  @param  swpLocationReverseGeocode   swpLocationReverseGeocode
 */
- (void)swpLocationReverseGeocode:(void (^)(SwpLocation * _Nonnull, SwpLocationModel * _Nonnull, NSError * _Nonnull))swpLocationReverseGeocode {
    
    _swpLocationReverseGeocode = swpLocationReverseGeocode;
}


/**
 *  @author swp_song
 *
 *  @brief  swpLocationReverseGeocodeChain  ( SwpLocation 回调方法，反地理编码调用 )
 */
- (SwpLocation * _Nonnull (^)(void (^)(SwpLocation * _Nonnull, SwpLocationModel * _Nonnull , NSError * _Nonnull)))swpLocationReverseGeocodeChain {
    return ^(void(^swpLocationReverseGeocode)(SwpLocation *swpLocation, SwpLocationModel *model, NSError *error)) {
        _swpLocationReverseGeocode = swpLocationReverseGeocode;
        return self;
    };
}




#pragma mark - Init Methods
- (CLLocationManager *)locationManager {
    
    return !_locationManager ? _locationManager = ({
       CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate      = self;
        locationManager;
    }) : _locationManager;
}

- (CLGeocoder *)geocoder{
    
    return !_geocoder ? _geocoder = ({
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        geocoder;
    }) : _geocoder;
}

@end

