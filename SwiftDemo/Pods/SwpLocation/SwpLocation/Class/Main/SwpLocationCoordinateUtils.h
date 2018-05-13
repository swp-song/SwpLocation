//
//  SwpLocationCoordinateUtils.h
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpLocationType.h"

NS_ASSUME_NONNULL_BEGIN

/* 定位坐标，数据类型 */
typedef double SwpLocationDegrees2D;

/* 定位坐标结构体 */
struct SwpLocationCoordinate2D {
    SwpLocationDegrees2D latitude;
    SwpLocationDegrees2D longitude;
};

typedef struct SwpLocationCoordinate2D SwpLocationCoordinate2D;

@interface SwpLocationCoordinateUtils : NSObject

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
+ (SwpLocationCoordinate2D)swpLocationCoordinate2DMake:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

/**
 *  @author swp_song
 *
 *  @brief  SwpDownloadProgressMake ( 快速初始化 )
 *
 *  @param  latitude   latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
SwpLocationCoordinate2D SwpLocationCoordinate2DMake(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);


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
+ (BOOL)swpLocationCoordinateUtilsWhetherInInChina:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
BOOL SwpLocationCoordinateUtilsWhetherInInChina(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);


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
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsGCJ02ToBD09:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
SwpLocationCoordinate2D SwpLocationCoordinateUtilsGCJ02ToBD09(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);

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
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsBD09ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
SwpLocationCoordinate2D SwpLocationCoordinateUtilsBD09ToGCJ02(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);

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
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsWGS84ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
SwpLocationCoordinate2D SwpLocationCoordinateUtilsWGS84ToGCJ02(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);

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
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsGCJ02ToWGS84:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
SwpLocationCoordinate2D SwpLocationCoordinateUtilsGCJ02ToWGS84(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);

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
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsBD09ToWGS84:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
SwpLocationCoordinate2D SwpLocationCoordinateUtilsBD09ToWGS84(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);

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
+ (SwpLocationCoordinate2D)swpLocationCoordinateUtilsWGS84ToBD09:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
SwpLocationCoordinate2D SwpLocationCoordinateUtilsWGS84ToBD09(SwpLocationDegrees2D latitude, SwpLocationDegrees2D longitude);



@end
NS_ASSUME_NONNULL_END
