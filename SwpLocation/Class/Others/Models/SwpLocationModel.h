//
//  SwpLocationModel.h
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwpLocationModel : NSObject

/* 定位坐标，数据类型 */
typedef double SwpLocationDegrees;

/* 定位坐标结构体 */
struct SwpLocationCoordinate {
    SwpLocationDegrees latitude;
    SwpLocationDegrees longitude;
};

typedef struct SwpLocationCoordinate SwpLocationCoordinate;

/**
 *  @author swp_song
 *
 *  @brief  SwpLocationCoordinateMake   ( 快速初始化 )
 *
 *  @param  latitude   latitude
 *
 *  @param  longitude   longitude
 *
 *  @return SwpLocationCoordinate
 */
SwpLocationCoordinate SwpLocationCoordinateMake(SwpLocationDegrees latitude, SwpLocationDegrees longitude);

/* 国家代码 */
@property (nonatomic, copy, readonly, nullable) NSString *ISOcountryCode;
/* 国家 */
@property (nonatomic, copy, readonly, nullable) NSString *country;
/* 省 */
@property (nonatomic, copy, readonly, nullable) NSString *administrativeArea;
/* 省，二级 */
@property (nonatomic, copy, readonly, nullable) NSString *subAdministrativeArea;
/* 市 */
@property (nonatomic, copy, readonly, nullable) NSString *locality;
/* 区 */
@property (nonatomic, copy, readonly, nullable) NSString *subLocality;
/* 街道 */
@property (nonatomic, copy, readonly, nullable) NSString *thoroughfare;
/* 门牌 */
@property (nonatomic, copy, readonly, nullable) NSString *subThoroughfare;
/* 街道 + 门牌 */
@property (nonatomic, copy, readonly, nullable) NSString *name;
/* 邮编 */
@property (nonatomic, copy, readonly, nullable) NSString *postalCode;
/* 原始数据 */
@property (nonatomic, copy, readonly, nullable) NSDictionary *addressDictionary;

/* GCJ02 坐标系 < 火星坐标系 > */
@property (nonatomic, assign, readonly) SwpLocationCoordinate locationGCJ02;
/* BD09 坐标系 < 百度坐标系 > */
@property (nonatomic, assign, readonly) SwpLocationCoordinate locationBD09;

/* 定位地址 */
@property (nonatomic, copy, readonly, nullable) NSString    *locationAddress;

/* GCJ02 坐标系纬度  < 火星坐标系 > */
@property (nonatomic, copy, readonly, nullable) NSNumber    *latitudeGCJ02;
/* GCJ02 坐标系经度  < 火星坐标系 > */
@property (nonatomic, copy, readonly, nullable) NSNumber    *longitudeGCJ02;

/* BD09 坐标系纬度   < 百度坐标系 > */
@property (nonatomic, copy, readonly, nullable) NSNumber    *latitudeBD09;
/* BD09 坐标系经度   < 百度坐标系 > */
@property (nonatomic, copy, readonly, nullable) NSNumber    *longitudeBD09;
/* 时区 */
@property (nonatomic, copy, readonly, nullable) NSTimeZone  *timeZone;
/* 原始数据 */
@property (nonatomic, copy, readonly, nullable) NSDictionary *swpLocationDictionary;


/**
 *  @author swp_song
 *
 *  @brief  swpLocationWithDictionary:  ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpLocationWithDictionary:(NSDictionary *)dictionary;

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end



NS_ASSUME_NONNULL_END
