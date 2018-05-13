#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SwpBaseLocation.h"
#import "SwpLocation.h"
#import "SwpLocationCoordinateUtils.h"
#import "SwpLocationDelegate.h"
#import "SwpLocationHeader.h"
#import "SwpLocationType.h"
#import "SwpLocationModel.h"
#import "SwpLocationTools.h"

FOUNDATION_EXPORT double SwpLocationVersionNumber;
FOUNDATION_EXPORT const unsigned char SwpLocationVersionString[];

