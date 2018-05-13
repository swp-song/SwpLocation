//
//  SwpLocationDelegate.h
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpLocationType.h"

@class SwpLocation, SwpLocationModel;


NS_ASSUME_NONNULL_BEGIN

@protocol SwpLocationDelegate <NSObject>

@optional

/**
 *  @author swp_song
 *
 *  @brief  swpLocation:swpLocationDidChangeAuthorizationStatus:    ( SwpLocation 代理方法，获取定位权限，定位权限发生改变时调用 )
 *
 *  @param  swpLocation swpLocation
 *
 *  @param  status      status
 */
- (void)swpLocation:(SwpLocation *)swpLocation swpLocationDidChangeAuthorizationStatus:(SwpLocationAuthorizedStatus)status;


/**
 *  @author swp_song
 *
 *  @brief  swpLocation:locationSuccess:    ( SwpLocation 代理方法，定位成功调用 )
 *
 *  @param  swpLocation swpLocation
 *
 *  @param  locations   locations
 */
- (void)swpLocation:(SwpLocation *)swpLocation locationSuccess:(NSArray *)locations;

/**
 *  @author swp_song
 *
 *  @brief  swpLocation:locationError:  ( SwpLocation 代理方法，定位失败调用 )
 *
 *  @param  swpLocation swpLocation
 *
 *  @param  error       error
 */
- (void)swpLocation:(SwpLocation *)swpLocation locationError:(NSError *)error;

/**
 *  @author swp_song
 *
 *  @brief  swpLocation:reverseGeocodeLocation:error:   ( SwpLocation 代理方法，获取反地理编码 )
 *
 *  @param  swpLocation swpLocation
 *
 *  @param  model       model
 *
 *  @param  error       error
 */
- (void)swpLocation:(SwpLocation *)swpLocation reverseGeocodeLocation:(SwpLocationModel *)model error:(NSError * _Nullable)error;


@end
NS_ASSUME_NONNULL_END
