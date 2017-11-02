//
//  SwpLocationModel.m
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpLocationModel.h"

#import <objc/message.h>

@implementation SwpLocationModel


/**
 *  @author swp_song
 *
 *  @brief  swpLocationWithDictionary:  ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
+ (instancetype)swpLocationWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 快速初始化 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return NSObject
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {

        
        NSDictionary *keys = [self getProperties];
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
            if ([key isEqualToString:keys[key]]) {
                [self setValue:value forKey:key];
            }
        }];
        
        _locationGCJ02      = SwpLocationCoordinateMake(_latitudeGCJ02.doubleValue, _longitudeGCJ02.doubleValue);
        _locationBD09       = SwpLocationCoordinateMake(_latitudeBD09.doubleValue, _longitudeBD09.doubleValue);
        _locationAddress    = [_addressDictionary[@"FormattedAddressLines"] firstObject];
        _swpLocationDictionary = [self modelToDictionary];
    }
    return self;
    
}


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
SwpLocationCoordinate SwpLocationCoordinateMake(SwpLocationDegrees latitude, SwpLocationDegrees longitude) {
    SwpLocationCoordinate swpLocationCoordinate;
    swpLocationCoordinate.latitude  = latitude;
    swpLocationCoordinate.longitude = longitude;
    return swpLocationCoordinate;
}

/**
 *  @author swp_song
 *
 *  @brief  getProperties:  ( 获取当前类全部属性 )
 *
 *  @return NSDictionary
 */
- (NSDictionary *)getProperties {
    
    NSMutableDictionary *datas = @{}.mutableCopy;
    unsigned int outCount;
    objc_property_t *properties  = class_copyPropertyList(self.class, &outCount);
    for (int i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        //  得到属性名
        NSString *key   = [NSString stringWithUTF8String:property_getName(property)];
        [datas setObject:key forKey:key];
    }
    return datas.copy;
}

/**
 *  @author swp_song
 *
 *  @brief  modelToDictionary:  ( 当前模型数据转换成字典 )
 *
 *  @return NSDictionary
 */
- (NSDictionary *)modelToDictionary {
    
    NSMutableDictionary *datas = @{}.mutableCopy;
    unsigned int outCount;
    objc_property_t *properties  = class_copyPropertyList(self.class, &outCount);
    for (int i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        
        //  获取属性名
        NSString *key   = [NSString stringWithUTF8String:property_getName(property)];
        
        //  获取属性值
        id value        = [self valueForKey:key];
        
        if (key && value != nil) {
            [datas setObject:value forKey:key];
        }
    }
    return datas.copy;
}


@end

