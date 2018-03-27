//
//  SwpLocationTools.h
//  swp_song
//
//  Created by swp_song on 2017/10/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface SwpLocationTools : NSObject

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
+ (NSDictionary *)swpLocationToolsPackagingData:(id)model latitudeGCJ02:(NSNumber *)latitudeGCJ02 longitudeGCJ02:(NSNumber *)longitudeGCJ02 latitudeBD09:(NSNumber *)latitudeBD09 longitudeBD09:(NSNumber *)longitudeBD09;

@end
NS_ASSUME_NONNULL_END
