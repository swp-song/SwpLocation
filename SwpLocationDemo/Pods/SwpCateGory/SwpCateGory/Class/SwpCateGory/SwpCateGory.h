//
//  SwpCateGory.h
//  swp_song
//
//  Created by swp_song on 2018/3/27.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpCateGory : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpCateGoryInfo ( SwpCateGory 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpCateGoryInfo;

/**
 *  @author swp_song
 *
 *  @brief  swpCateGoryVersion  ( SwpCateGory 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpCateGoryVersion;



@end
NS_ASSUME_NONNULL_END
