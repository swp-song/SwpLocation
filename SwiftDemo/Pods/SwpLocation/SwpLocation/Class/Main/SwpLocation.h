//
//  SwpLocation.h
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBaseLocation.h"

NS_ASSUME_NONNULL_BEGIN


@interface SwpLocation : SwpBaseLocation

/**
 *  @author swp_song
 *
 *  @brief  shareInstanceInit   ( 单利 )
 */
+ (__kindof SwpLocation * _Nonnull (^)(void))shareInstanceInit;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationOpen ( 打开定位 )
 */
- (void)swpLocationOpen;


/**
 *  @author swp_song
 *
 *  @brief  swpLocationOpenChain    ( 打开定位 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void))swpLocationOpenChain;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationStart    ( 开启定位 )
 */
- (void)swpLocationStart;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationStartChain   ( 开启定位 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void))swpLocationStartChain;

/**
 *  @author swp_song
 *
 *  @brief  swpStartLocation    ( 停止定位 )
 */
- (void)swpLocationStop;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationStartChain   ( 停止定位 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void))swpLocationStopChain;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationMode ( 设置定位模式 )
 */
- (__kindof SwpLocation * _Nonnull (^)(SwpLocationMode))swpLocationMode;

/* 代理属性 */
@property (nonatomic, weak, nullable) id<SwpLocationDelegate>delegate_;

/**
 *  @author swp_song
 *
 *  @brief  delegate    ( 设置代理 )
 */
- (__kindof SwpLocation * _Nonnull (^)(id<SwpLocationDelegate> _Nullable))delegate;


#pragma mark - SwpLocation Block Methods
/**
 *  @author swp_song
 *
 *  @brief  swpLocationDidChangeAuthorizationStatus:    ( SwpLocation 回调方法，获取定位权限，定位权限发生改变时调用 )
 *
 *  @param  swpLocationDidChangeAuthorizationStatus swpLocationDidChangeAuthorizationStatus
 */
- (void)swpLocationDidChangeAuthorizationStatus:(void (^ _Nullable)(SwpLocation * _Nonnull swpLocation, SwpLocationAuthorizedStatus status))swpLocationDidChangeAuthorizationStatus;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationDidChangeAuthorizationStatusChain    ( SwpLocation 回调方法，获取定位权限，定位权限发生改变时调用 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void (^ _Nullable)(SwpLocation * _Nonnull, SwpLocationAuthorizedStatus)))swpLocationDidChangeAuthorizationStatusChain;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationSuccess: ( SwpLocationAuthorizedStatus 回调方法，定位成功调用 )
 *
 *  @param  swpLocationSuccess  swpLocationSuccess
 */
- (void)swpLocationSuccess:(void (^ _Nullable)(SwpLocation * _Nonnull swpLocation, NSArray * _Nonnull locations))swpLocationSuccess;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationSuccessChain ( SwpLocation 回调方法，定位成功调用 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void (^ _Nullable)(SwpLocation * _Nonnull, NSArray * _Nonnull)))swpLocationSuccessChain;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationError:   ( SwpLocation 回调方法，定位失败调用 )
 *
 *  @param  swpLocationError    swpLocationError
 */
- (void)swpLocationError:(void (^ _Nullable)(SwpLocation * _Nonnull swpLocation, NSError * _Nonnull error))swpLocationError;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationErrorChain   ( SwpLocation 回调方法，定位失败调用 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void (^ _Nullable)(SwpLocation * _Nonnull, NSError * _Nonnull)))swpLocationErrorChain;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationReverseGeocode:  ( SwpLocation 回调方法，反地理编码调用 )
 *
 *  @param  swpLocationReverseGeocode   swpLocationReverseGeocode
 */
- (void)swpLocationReverseGeocode:(void (^ _Nullable)(SwpLocation * _Nonnull swpLocation, SwpLocationModel * _Nonnull model, NSError * _Nonnull error))swpLocationReverseGeocode;

/**
 *  @author swp_song
 *
 *  @brief  swpLocationReverseGeocodeChain  ( SwpLocation 回调方法，反地理编码调用 )
 */
- (__kindof SwpLocation * _Nonnull (^)(void (^)(SwpLocation * _Nonnull, SwpLocationModel * _Nonnull , NSError * _Nonnull)))swpLocationReverseGeocodeChain;



@end
NS_ASSUME_NONNULL_END
