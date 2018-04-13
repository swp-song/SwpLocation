//
//  SwpLocationCoordinateUtils.m
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpLocationCoordinateUtils.h"

@implementation SwpLocationCoordinateUtils

/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinate2DMake:longitude:  ( 快速初始化 )
 *
 *  @param   latitude   latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationCoordinate2DMake:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinate2DMake(latitude, longitude);
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
    return _SwpLocationCoordinate2DMake(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinateUtilsWhetherInInChina:longitude:   ( 验证坐标是否在中国 )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return BOOL         YES = in In China, NO = Not In China
 */
+ (BOOL)swpLocationCoordinateUtilsWhetherInInChina:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinateUtilsWhetherInInChina(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsWhetherInInChina  ( 验证坐标是否在中国 )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return BOOL         YES = in In China, NO = Not In China
 */
BOOL SwpLocationCoordinateUtilsWhetherInInChina(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    return _SwpLocationCoordinateUtilsWhetherInInChina(latitude, longitude);
}

#pragma mark - GCJ-02 <火星坐标系> <----> BD-09 <百度坐标系>
/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinateUtilsGCJ02ToBD09:longitude:    ( GCJ-02 <火星坐标系> -> BD-09 <百度坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsGCJ02ToBD09:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinateUtilsGCJ02ToBD09(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsGCJ02ToBD09   ( GCJ-02 <火星坐标系> -> BD-09 <百度坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinateUtilsGCJ02ToBD09(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    return _SwpLocationCoordinateUtilsGCJ02ToBD09(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinateUtilsBD09ToGCJ02:longitude:    ( BD-09 <百度坐标系> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsBD09ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinateUtilsBD09ToGCJ02(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsBD09ToGCJ02   ( BD-09 <百度坐标系> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinateUtilsBD09ToGCJ02(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    return _SwpLocationCoordinateUtilsBD09ToGCJ02(latitude, longitude);
}

#pragma mark - WGS-84 <国际标准坐标>  <----> GCJ-02 <火星坐标系>
/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinateUtilsWGS84ToGCJ02:longitude:   ( WGS-84 <国际标准坐标> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsWGS84ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinateUtilsWGS84ToGCJ02(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsWGS84ToGCJ02  ( WGS-84 <国际标准坐标> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinateUtilsWGS84ToGCJ02(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    
    if (!SwpLocationCoordinateUtilsWhetherInInChina(latitude, longitude)) return SwpLocationCoordinate2DMake(latitude, longitude);
    return _SwpLocationCoordinateUtilsWGS84ToGCJ02(latitude, longitude);
}


/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinateUtilsGCJ02ToWGS84:longitude:   ( GCJ-02 <火星坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpCoordinates
 */
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsGCJ02ToWGS84:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinateUtilsGCJ02ToWGS84(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsGCJ02ToWGS84  ( GCJ-02 <火星坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinateUtilsGCJ02ToWGS84(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    if (!SwpLocationCoordinateUtilsWhetherInInChina(latitude, longitude)) return SwpLocationCoordinate2DMake(latitude, longitude);
    return _SwpLocationCoordinateUtilsGCJ02ToWGS84(latitude, longitude);
}

#pragma mark - WGS-84 <国际标准坐标> <----> BD-09 <百度坐标系>
/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinateUtilsBD09ToWGS84:longitude:    ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsBD09ToWGS84:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinateUtilsBD09ToWGS84(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsBD09ToWGS84   ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinateUtilsBD09ToWGS84(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    if (!SwpLocationCoordinateUtilsWhetherInInChina(latitude, longitude)) return SwpLocationCoordinate2DMake(latitude, longitude);
    return _SwpLocationCoordinateUtilsBD09ToWGS84(latitude, longitude);
}


/**
 *  @author swp_song
 *
 *  @brief  swpLocationCoordinateUtilsWGS84ToBD09:longitude:    ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsWGS84ToBD09:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude {
    return SwpLocationCoordinateUtilsWGS84ToBD09(latitude, longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsWGS84ToBD09   ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinateUtilsWGS84ToBD09(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    if (!SwpLocationCoordinateUtilsWhetherInInChina(latitude, longitude)) return SwpLocationCoordinate2DMake(latitude, longitude);
    return _SwpLocationCoordinateUtilsWGS84ToBD09(latitude, longitude);
}



#pragma mark - Private Methods
#pragma mark - Private GCJ-02 <火星坐标系> <----> BD-09 <百度坐标系> Methods
/**
 *  @author swp_song
 *
 *  @brief  _SwpLocationCoordinateUtilsGCJ02ToBD09  ( GCJ-02 <火星坐标系> -> BD-09 <百度坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
FOUNDATION_STATIC_INLINE SwpLocationCoordinate2D _SwpLocationCoordinateUtilsGCJ02ToBD09(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    
    SwpLocationDegrees2D x     = longitude;
    SwpLocationDegrees2D y     = latitude;
    SwpLocationDegrees2D z     = sqrt(x * x + y * y) + 0.00002 * sin(y * M_PI);
    SwpLocationDegrees2D theta = atan2(y, x) + 0.000003 * cos(x * M_PI);
    return SwpLocationCoordinate2DMake(z * sin(theta) + 0.006, z * cos(theta) + 0.0065);
}


/**
 *  @author swp_song
 *
 *  @brief  _SwpLocationCoordinateUtilsBD09ToGCJ02  ( BD-09 <百度坐标系> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
FOUNDATION_STATIC_INLINE SwpLocationCoordinate2D _SwpLocationCoordinateUtilsBD09ToGCJ02(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    
    SwpLocationDegrees2D x     = longitude - 0.0065;
    SwpLocationDegrees2D y     = latitude  - 0.006;
    SwpLocationDegrees2D z     = sqrt(x * x + y * y) - 0.00002 * sin(y * M_PI);
    SwpLocationDegrees2D theta = atan2(y, x) - 0.000003 * cos(x * M_PI);
    return SwpLocationCoordinate2DMake(z * sin(theta), z * cos(theta));
}

#pragma mark - Private WGS-84 <国际标准坐标>  <----> GCJ-02 <火星坐标系> Methods
/**
 *  @author swp_song
 *
 *  @brief  _SwpLocationCoordinateUtilsWGS84ToGCJ02 ( WGS-84 <国际标准坐标> -> GCJ-02 <火星坐标系> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
FOUNDATION_STATIC_INLINE SwpLocationCoordinate2D _SwpLocationCoordinateUtilsWGS84ToGCJ02(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    
    static const double SWP_AA    = 6378245.0;
    static const double SWP_EE    = 0.00669342162296594323;
    SwpLocationDegrees2D wgLat    = latitude;
    SwpLocationDegrees2D wgLon    = longitude;
    SwpLocationDegrees2D dLat     = TransformLatitude(wgLon - 105.0, wgLat - 35.0);
    SwpLocationDegrees2D dLon     = TransformLongitude(wgLon - 105.0, wgLat - 35.0);
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
 *  @brief  SwpLocationCoordinateUtilsGCJ02ToWGS84  ( GCJ-02 <火星坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
FOUNDATION_STATIC_INLINE SwpLocationCoordinate2D _SwpLocationCoordinateUtilsGCJ02ToWGS84(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    //  1.Transform GCJ02
    SwpLocationCoordinate2D GCJ02 = _SwpLocationCoordinateUtilsWGS84ToGCJ02(latitude, longitude);
    
     return SwpLocationCoordinate2DMake(latitude * 2 - GCJ02.latitude,  longitude * 2 - GCJ02.longitude);
}

#pragma mark - Private WGS-84 <国际标准坐标> <----> BD-09 <百度坐标系> Methods
/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsBD09ToWGS84   ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
FOUNDATION_STATIC_INLINE SwpLocationCoordinate2D _SwpLocationCoordinateUtilsBD09ToWGS84(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    //  1. BD-09 Transform GCJ02
    SwpLocationCoordinate2D GCJ02 = _SwpLocationCoordinateUtilsBD09ToGCJ02(latitude, longitude);
    //  1. GCJ02 Transform WGS84
    return _SwpLocationCoordinateUtilsGCJ02ToWGS84(GCJ02.latitude, GCJ02.longitude);
}

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateUtilsWGS84ToBD09   ( BD-09 <百度坐标系> -> WGS-84 <国际标准坐标> )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
FOUNDATION_STATIC_INLINE SwpLocationCoordinate2D _SwpLocationCoordinateUtilsWGS84ToBD09(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    //  1.  WGS84 Transform GCJ02
    SwpLocationCoordinate2D GCJ02 = _SwpLocationCoordinateUtilsWGS84ToGCJ02(latitude, longitude);
    //  2.  GCJ02 Transform BD09
    return _SwpLocationCoordinateUtilsGCJ02ToBD09(GCJ02.latitude, GCJ02.longitude);
}


#pragma mark - Private Other Methods


/**
 *  @author swp_song
 *
 *  @brief  _SwpLocationCoordinate2DMake    ( 快速初始化 )
 *
 *  @param   latitude   latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
FOUNDATION_STATIC_INLINE SwpLocationCoordinate2D _SwpLocationCoordinate2DMake(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    SwpLocationCoordinate2D swpLocationCoordinate2D;
    swpLocationCoordinate2D.latitude    = latitude;
    swpLocationCoordinate2D.longitude   = longitude;
    return swpLocationCoordinate2D;
}

/**
 *  @author swp_song
 *
 *  @brief  _SwpLocationCoordinateUtilsWhetherInInChina  ( 验证坐标是否在中国 )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return BOOL         YES = in In China, NO = Not In China
 */
FOUNDATION_STATIC_INLINE BOOL _SwpLocationCoordinateUtilsWhetherInInChina(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude) {
    // not in China
    if (longitude < 72.004 || longitude > 137.8347 || latitude < 0.8293 || latitude > 55.8271) return NO;
    return YES;
}

/**
 *  @author swp_song
 *
 *  @brief  TransformLatitude:  ( 坐标转换 )
 *
 *  @param  x   x
 *
 *  @param  y   y
 *
 *  @return SwpLocationDegrees2D
 */
FOUNDATION_STATIC_INLINE double TransformLatitude(double x, double y) {
    
    static const double SWP_M_PI = M_PI * 3000.00 / 180.00;
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * SWP_M_PI) + 20.0 * sin(2.0 * x * SWP_M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * SWP_M_PI) + 40.0 * sin(y / 3.0 * SWP_M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * SWP_M_PI) + 320 * sin(y * SWP_M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

/**
 *  @author swp_song
 *
 *  @brief  TransformLongitude: ( 坐标转换 )
 *
 *  @param  x   x
 *
 *  @param  y   y
 *
 *  @return SwpLocationDegrees2D
 */
FOUNDATION_STATIC_INLINE double TransformLongitude(double x, double y) {
    
    static const double SWP_M_PI = M_PI * 3000.00 / 180.00;
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * SWP_M_PI) + 20.0 * sin(2.0 * x * SWP_M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * SWP_M_PI) + 40.0 * sin(x / 3.0 * SWP_M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * SWP_M_PI) + 300.0 * sin(x / 30.0 * SWP_M_PI)) * 2.0 / 3.0;
    return ret;
}



@end

