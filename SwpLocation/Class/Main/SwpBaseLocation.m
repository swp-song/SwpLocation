//
//  SwpBaseLocation.m
//  swp_song
//
//  Created by swp_song on 2017/10/30.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBaseLocation.h"



@interface SwpBaseLocation()

@end

static id swpBaseLocation_;

@implementation SwpBaseLocation

#pragma mark - Override Methods
/**
 *  @author swp_song
 *
 *  @brief  allocWithZone: ( Override  allocWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swpBaseLocation_ = [super allocWithZone:zone];
    });
    return swpBaseLocation_;
}

/**
 *  @author swp_song
 *
 *  @brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
- (id)copyWithZone:(NSZone *)zone {
    return  swpBaseLocation_;
}


/**
 *  @author swp_song
 *
 *  @brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (id)copyWithZone:(struct _NSZone *)zone {
    return  swpBaseLocation_;
}

/**
 *  @author swp_song
 *
 *  @brief  mutableCopyWithZone:   ( Override  mutableCopyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return swpBaseLocation_;
}

/**
 *  @author swp_song
 *
 *  @brief  mutableCopyWithZone: ( Override  mutableCopyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return swpBaseLocation_;
}


/**
 *  @author swp_song
 *
 *  @brief  init    ( Override init )
 *
 *  @return id
 */
- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
    
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  shareInstance   ( 单利 )
 *
 *  @return NSObject
 */
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        swpBaseLocation_ = [[self alloc] init];
    });
    return swpBaseLocation_;
}


/**
 *  @author swp_song
 *
 *  @brief  swpLocationInfo ( 获取 SwpLocation 信息 )
 *
 *  @return NSDictionary
 */
- (NSDictionary *)swpLocationInfo {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpLocation.bundle/SwpLocation.plist" ofType:nil]].copy;
}

/**
 *  @author swp_song
 *
 *  @brief  swpLocationVersion  ( 获取 SwpLocation 版本号 )
 *
 *  @return NSString
 */
- (NSString *)swpLocationVersion {
    return [self swpLocationInfo][@"Version"];
}


@end

