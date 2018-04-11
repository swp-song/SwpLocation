# SwpLocation


[![Xcode](https://img.shields.io/badge/Xcode-9.3-25B1F6.svg)](https://developer.apple.com/xcode)
[![iOS](https://img.shields.io/badge/iOS-8.0+-1C75AF.svg)](https://developer.apple.com/xcode)
[![BuildStatus](https://travis-ci.org/swp-song/SwpLocation.svg?branch=master)](https://travis-ci.org/swp-song/SwpLocation)
[![Version](https://img.shields.io/cocoapods/v/SwpLocation.svg?style=flat)](http://cocoapods.org/pods/SwpLocation)
[![License](https://img.shields.io/cocoapods/l/SwpLocation.svg?style=flat)](http://cocoapods.org/pods/SwpLocation)
[![Platform](https://img.shields.io/cocoapods/p/SwpLocation.svg?style=flat)](http://cocoapods.org/pods/SwpLocation)
[![SwpLocationAPI](https://img.shields.io/badge/SwpLocationAPI-v1.2.4-44E0D3.svg)](https://swp-song.com/docs/SwpLocation/)



-------

###  简介
> * 简单封装系统定位，并进行坐标转换： 
> * **GCJ-02 「火星坐标系」转换BD-09「百度坐标系」**
> * **BD-09 「百度坐标系」转换 GCJ-02「火星坐标系」**
> * **WGS-84 「国际标准坐标」 转换 GCJ-02「火星坐标系」**
> * **GCJ-02 「火星坐标系」转换 WGS-84「国际标准坐标」**
> * **BD-09 「百度坐标系」转换 WGS-84「国际标准坐标」**
> * **WGS-84「国际标准坐标」转换 BD-09 「百度坐标系」**


-------

### 效果

![(效果)](https://raw.githubusercontent.com/swp-song/SwpLocation/master/Screenshot/SwpLocation.gif)

-------


### 导入

> * 手动导入：
>
>> * **SwpLocation** 文件夹导入项目中。
>> * **`#import "SwpLocationHeader.h`**
>>
> -------

> * CocoaPods 导入:
>
>> * **pod search SwpLocation**
>> * **pod 'SwpLocation'**
>> * **`#import <SwpLocation/SwpLocationHeader.h>`**
>>
> -------

-------

### 代码示例:

```Objective-C

//  初始化
SwpLocation.shareInstanceInit()
//  打开定位
.swpLocationOpenChain()
//  定位失败回调
.swpLocationErrorChain(^(SwpLocation *swpLocation, NSError *error){
    //  处理内容
})
//  定位成功，获取定位信息回调
.swpLocationReverseGeocodeChain(^(SwpLocation *swpLocation, SwpLocationModel *model, NSError *error){

    // 坐标转换
    SwpLocationCoordinate2D GCJ02_0 = SwpLocationCoordinate2DMake(model.latitudeGCJ02.doubleValue, model.longitudeGCJ02.doubleValue);
    NSLog(@"GCJ02_0 = %@,%@", @(GCJ02_0.longitude), @(GCJ02_0.latitude));
    
    //  GCJ02 转换 WGS84
    SwpLocationCoordinate2D WGS84_0 = SwpLocationCoordinateUtilsGCJ02ToWGS84(GCJ02_0.latitude, GCJ02_0.longitude);
    NSLog(@"WGS84_0 = %@,%@", @(WGS84_0.longitude), @(WGS84_0.latitude));
    
    //  WGS84 转换 GCJ02
    SwpLocationCoordinate2D GCJ02_1 = SwpLocationCoordinateUtilsWGS84ToGCJ02(WGS84_0.latitude, WGS84_0.longitude);
    NSLog(@"GCJ02_1 = %@,%@", @(GCJ02_1.longitude), @(GCJ02_1.latitude));
            
    SwpLocationCoordinate2D DB_90_0 = SwpLocationCoordinate2DMake(model.latitudeBD09.doubleValue, model.longitudeBD09.doubleValue);
    NSLog(@"DB_90_0 = %@,%@", @(DB_90_0.longitude), @(DB_90_0.latitude));
    
    //  BD09 转换 WGS84
    SwpLocationCoordinate2D WGS84_1 = SwpLocationCoordinateUtilsBD09ToWGS84(DB_90_0.latitude, DB_90_0.longitude);
    NSLog(@"WGS84_1 = %@,%@", @(WGS84_1.longitude), @(WGS84_1.latitude));
    
    //  WGS84 转换 BD09
    SwpLocationCoordinate2D DB_90_1 = SwpLocationCoordinateUtilsWGS84ToBD09(WGS84_1.latitude, WGS84_1.longitude);
    NSLog(@"DB_90_1 = %@,%@", @(DB_90_1.longitude), @(DB_90_1.latitude));
});

```

-------

### 注意：

**请在 项目中 Info.plist 配置以下获取定位权限：**
> * **Privacy - Location Always and When In Use Usage Description** : 我们需要通过您的地理位置信息获取您周边的相关数据
> * **Privacy - Location Always Usage Description** : 我们需要通过您的地理位置信息获取您周边的相关数据
> * **Privacy - Location When In Use Usage Description** : 使用应用期间
>
-------

### SwpLocation 文档

> * [SwpLocation 文档](https://swp-song.com/docs/SwpLocation/)

-------


### 版本记录

> * 版本版本：1.2.4
> * 更新时间：2018-04-11 13:04:22
> * 更新内容：
>> * 更新 Demo，迭代版本。

>> -------

> * 版本版本：1.2.3
> * 更新时间：2018-04-09 16:56:41
> * 更新内容：
>>  *  内部优化，修改 Demo， 更新文档。

>> -------

-------

### 备注

> * 持续更新, 如果喜欢, 欢迎 Star

-------

### 声明

 > * **著作权归 ©swp_song，如需转载请标明出处**

-------


