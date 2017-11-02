//
//  SwpBaseLocation.h
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpLocationDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpBaseLocation : NSObject

/**
 *  @author swp_song
 *
 *  @brief  shareInstance   ( 单利 )
 *
 *  @return NSObject
 */
+ (instancetype)shareInstance;


@end
NS_ASSUME_NONNULL_END
