//
//  SwpCateGory.m
//  swp_song
//
//  Created by swp_song on 2018/3/27.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "SwpCateGory.h"

@implementation SwpCateGory


/**
 *  @author swp_song
 *
 *  @brief  swpCateGoryInfo ( SwpCateGory 信息 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpCateGoryInfo {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpCateGory.bundle/SwpCateGory.plist" ofType:nil]];
}

/**
 *  @author swp_song
 *
 *  @brief  swpCateGoryVersion  ( SwpCateGory 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpCateGoryVersion {
    return self.class.swpCateGoryInfo[@"Version"];
}

@end
