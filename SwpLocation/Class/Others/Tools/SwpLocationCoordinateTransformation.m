//
//  SwpLocationCoordinateTransformation.m
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpLocationCoordinateTransformation.h"

static const double SWP_AA      = 6378245.0;
static const double SWP_EE      = 0.00669342162296594323;
static const double SWP_M_PI    = M_PI * 3000.0 / 180.0;

@implementation SwpLocationCoordinateTransformation

/**
 *  @author swp_song
 *
 *  @brief  swpLocation_GCJ_02_Transformation_BD_09:longitude:  ( 火星坐标系 (GCJ-02) -> 百度坐标系 (BD-09) )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationGCJ02ToBD09:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    
    SwpLocationDegrees2D x     = longitude;
    SwpLocationDegrees2D y     = latitude;
    SwpLocationDegrees2D z     = sqrt(x * x + y * y) + 0.00002 * sin(y * SWP_M_PI);
    SwpLocationDegrees2D theta = atan2(y, x) + 0.000003 * cos(x * SWP_M_PI);
    return SwpLocationCoordinate2DMake(z * sin(theta) + 0.006, z * cos(theta) + 0.0065);
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocation_BD_09_Transformation_GCJ_02:longitude:  ( 百度坐标系 (BD-09) -> 火星坐标系 (GCJ-02) )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationBD09ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    
    SwpLocationDegrees2D x     = longitude - 0.0065;
    SwpLocationDegrees2D y     = latitude  - 0.006;
    SwpLocationDegrees2D z     = sqrt(x * x + y * y) - 0.00002 * sin(y * SWP_M_PI);
    SwpLocationDegrees2D theta = atan2(y, x) - 0.000003 * cos(x * SWP_M_PI);
    return SwpLocationCoordinate2DMake(z * sin(theta), z * cos(theta));
}

// 地球坐标系 (WGS-84) -> 火星坐标系 (GCJ-02)

/**
 *  @author swp_song
 *
 *  @brief  swpLocation_BD_09_Transformation_GCJ_02:longitude:  ( 地球坐标系 (WGS-84) -> 火星坐标系 (GCJ-02) )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationWGS84ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    
    if ([self.class verifyThatInChina:latitude longitude:longitude]) return SwpLocationCoordinate2DMake(latitude, longitude);
    
    SwpLocationDegrees2D wgLat    = latitude;
    SwpLocationDegrees2D wgLon    = longitude;
    SwpLocationDegrees2D dLat     = [self transformLat:wgLon - 105.0 y:wgLat - 35.0];
    SwpLocationDegrees2D dLon     = [self transformLon:wgLon - 105.0 y:wgLat - 35.0];
    SwpLocationDegrees2D radLat   = wgLat / 180.0 * M_PI;
    SwpLocationDegrees2D magic    = sin(radLat);
    magic = 1 - SWP_EE * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((SWP_AA * (1 - SWP_EE)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (SWP_AA / sqrtMagic * cos(radLat) * M_PI);
    return SwpLocationCoordinate2DMake(wgLat + dLat, wgLon + dLon);
}


/**
 *  @author swp_song
 *
 *  @brief  verifyThatInChina:  ( 验证坐标是否在天朝 )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude    longitude
 *
 *  @return BOOL
 */
+ (BOOL)verifyThatInChina:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    if (longitude < 72.004 || longitude > 137.8347) return YES;
    if (latitude < 0.8293 || latitude > 55.8271) return YES;
    return NO;
}


/**
 *  @author swp_song
 *
 *  @brief  transformLat:y: ( 坐标转换 )
 *
 *  @param  x   x
 *
 *  @param  y   y
 *
 *  @return SwpLocationDegrees2D
 */
+ (SwpLocationDegrees2D)transformLat:(SwpLocationDegrees2D)x y:(SwpLocationDegrees2D)y {
    SwpLocationDegrees2D ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * M_PI) + 40.0 * sin(y / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * M_PI) + 320 * sin(y * M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

/**
 *  @author swp_song
 *
 *  @brief  transformLon:y: ( 坐标转换 )
 *
 *  @param  x   x
 *
 *  @param  y   y
 *
 *  @return SwpLocationDegrees2D
 */
+ (SwpLocationDegrees2D)transformLon:(SwpLocationDegrees2D)x y:(SwpLocationDegrees2D)y {
    SwpLocationDegrees2D ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * M_PI) + 300.0 * sin(x / 30.0 * M_PI)) * 2.0 / 3.0;
    return ret;
}


/**
 *  @author swp_song
 *
 *  @brief  SwpDownloadProgressMake ( 快速初始化 )
 *
 *  @param   latitude   latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinate2DMake(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    SwpLocationCoordinate2D swpLocationCoordinate2D;
    swpLocationCoordinate2D.latitude    = latitude;
    swpLocationCoordinate2D.longitude   = longitude;
    return swpLocationCoordinate2D;
}


@end

