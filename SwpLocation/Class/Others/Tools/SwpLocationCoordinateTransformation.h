//
//  SwpLocationCoordinateTransformation.h
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

@interface SwpLocationCoordinateTransformation : NSObject


/**
 *  @author swp_song
 *
 *  @brief  swpLocation_GCJ_02_Transformation_BD_09:longitude:   ( 火星坐标系 (GCJ-02) -> 百度坐标系 (BD-09) )
 *
 *  @param  latitude    latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate2D
 */
+ (SwpLocationCoordinate2D)swpLocationGCJ02ToBD09:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
+ (SwpLocationCoordinate2D)swpLocationBD09ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

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
+ (SwpLocationCoordinate2D)swpLocationWGS84ToGCJ02:(SwpLocationDegrees2D)latitude longitude:(SwpLocationDegrees2D)longitude;

@end
NS_ASSUME_NONNULL_END
