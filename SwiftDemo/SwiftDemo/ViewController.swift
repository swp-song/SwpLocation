//
//  ViewController.swift
//  SwiftDemo
//
//  Created by swp_song on 2018/5/13.
//  Copyright © 2018年 swp-song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //  请配置对应的权限：
        //  Privacy - Location Always and When In Use Usage Description : 我们需要通过您的地理位置信息获取您周边的相关数据
        //  Privacy - Location Always Usage Description                 : 我们需要通过您的地理位置信息获取您周边的相关数据
        //  Privacy - Location When In Use Usage Description            : 使用应用期间
        
        //  坐标拾取系统：
        //  https://lbs.amap.com/console/show/picker              高德坐标拾取器
        //  https://api.map.baidu.com/lbsapi/getpoint/index.html  百度坐标拾取器
        
        //  注意：
        //  请尽量使用真机运行，模拟器运行请是设置好定位坐标。
        

        let _ : SwpLocation = SwpLocation.shareInstanceInit()()
            
            //  设置定位模式
            .swpLocationMode()(.requestAlwaysAuthorization)
            //  开启定位
            .swpLocationOpenChain()()
            
            //  定位成功
            .swpLocationSuccessChain()({(swpLocation, locations) in
                print(locations);
            })
            //  获取定位反地理编码
            .swpLocationReverseGeocodeChain()({ (swpLocation, model, error) in
                print(model.locationAddress!);
                print("GCJ-02「 火星坐标 」：\(model.longitudeGCJ02!), \(model.latitudeGCJ02!)");
                print("BD-09 「 百度坐标 」：\(model.longitudeBD09!), \(model.latitudeBD09!)");
                let WGS84 : SwpLocationCoordinate2D = SwpLocationCoordinateUtilsGCJ02ToWGS84((model.latitudeGCJ02?.doubleValue)!, (model.longitudeGCJ02?.doubleValue)!);
                print("WGS-84「 国际标准坐标 」：\(WGS84.longitude), \(WGS84.latitude)");
            })
            //  定位失败
            .swpLocationErrorChain()({ (swpLocation, error) in
                print("定位失败!");
            });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

