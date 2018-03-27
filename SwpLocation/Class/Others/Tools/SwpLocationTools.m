//
//  SwpLocationTools.m
//  swp_song
//
//  Created by swp_song on 2017/10/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpLocationTools.h"

#import <objc/message.h>

@implementation SwpLocationTools

/**
 *  @author swp_song
 *
 *  @brief  swpLocationToolsGetClassAllData:    ( 获取类中数据 )
 *
 *  @param  model   model
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpLocationToolsGetClassAllData:(id)model {
    
    NSMutableDictionary *datas = @{}.mutableCopy;
    unsigned int outCount;
    objc_property_t *properties  = class_copyPropertyList([model class], &outCount);
    for (int i = 0; i<outCount; i++) {
        objc_property_t property = properties[i];
        
        //  获取属性名
        NSString *key   = [NSString stringWithUTF8String:property_getName(property)];
        
        //  获取属性值
        id value        = [model valueForKey:key];
        
        if (key && value != nil) {
            [datas setObject:value forKey:key];
        }
    }
    return datas.copy;
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationToolsPackagingData:latitudeGCJ02:longitudeGCJ02:latitudeBD09:longitudeBD09:  ( 包装解析数据 )
 *
 *  @param  model           model
 *
 *  @param  latitudeGCJ02   latitudeGCJ02
 *
 *  @param  longitudeGCJ02  longitudeGCJ02
 *
 *  @param  latitudeBD09    latitudeBD09
 *
 *  @param  longitudeBD09   longitudeBD09
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpLocationToolsPackagingData:(id)model latitudeGCJ02:(NSNumber *)latitudeGCJ02 longitudeGCJ02:(NSNumber *)longitudeGCJ02 latitudeBD09:(NSNumber *)latitudeBD09 longitudeBD09:(NSNumber *)longitudeBD09 {
    
    NSMutableDictionary *datas = [self.class swpLocationToolsGetClassAllData:model].mutableCopy;
    [datas setObject:latitudeGCJ02 forKey:@"latitudeGCJ02"];
    [datas setObject:longitudeGCJ02 forKey:@"longitudeGCJ02"];
    [datas setObject:latitudeBD09 forKey:@"latitudeBD09"];
    [datas setObject:longitudeBD09 forKey:@"longitudeBD09"];
    return datas.copy;
}



@end

