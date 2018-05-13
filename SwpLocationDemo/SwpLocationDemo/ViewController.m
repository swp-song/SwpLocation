//
//  ViewController.m
//  SwpLocationDemo
//
//  Created by swp_song on 2018/3/27.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "ViewController.h"

/* ---------------------- Tool       ---------------------- */
#import <Masonry/Masonry.h>
#import <SwpCateGory/SwpCateGory.h>
#import <SwpCateGory/UIColor+SwpColor.h>
#import <SwpLocation/SwpLocationHeader.h>
#import <SwpCateGory/SwpAttributedHeader.h>
#import <SwpCateGory/UIButton+SwpSetButton.h>
#import <SwpCateGory/UIImage+SwpCreateImage.h>
/* ---------------------- Tool       ---------------------- */

@interface ViewController ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* 显示定位信息 */
@property (nonatomic, strong) UILabel   *locationView;
/* 获取定位按钮 */
@property (nonatomic, strong) UIButton  *clickLocationButton;
/* ---------------------- UI   Property  ---------------------- */

@end

@implementation ViewController

/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUI];
    
    [self location];
}

/**
 *  @author swp_song
 *
 *  @brief  didReceiveMemoryWarning ( 内存不足时调用 )
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Set UI Methods
/**
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {

    [self setUpUI];
    
    [self setUIAutoLayout];
}



/**
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
 
    [self.view addSubview:self.clickLocationButton];
    [self.view addSubview:self.locationView];
    
}

/**
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
 
    [self.clickLocationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(200, 10, 0, 10));
        make.width.equalTo(self.clickLocationButton.mas_height).multipliedBy(10);
    }];
    
    [self.locationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 10, 0, 10));
        make.top.equalTo(self.clickLocationButton.mas_bottom).offset(30);
    }];
    
    
    [UIButton swpSetButtonSubmitStyle:self.clickLocationButton setBackgroundColor:[UIColor whiteColor] setFontColor:[UIColor whiteColor] setTitle:@"获取坐标" setFontSize:14 setCornerRadius:0 setTag:0 setTarget:self setAction:@selector(clickButtonEvent:)];
}



/**
 *  @author swp_song
 *
 *  @brief  clickButtonEvent:   ( 按钮绑定方法 )
 *
 *  @param  button  button
 */
- (void)clickButtonEvent:(UIButton *)button {
    
    self.clickLocationButton.enabled = NO;
    
    self.locationView.attributedText = [self attributed:@"获取中..." setFont:[UIFont systemFontOfSize:14] setTextFontColor:UIColor.swpColorWithHexadecimal(0x2B2B2B)];
    
    [self location];
}



/**
 *  @author swp_song
 *
 *  @brief  location    ( 定位方法 )
 */
- (void)location {
    
    
    
    
    //  请配置对应的权限：
    //  Privacy - Location Always and When In Use Usage Description : 我们需要通过您的地理位置信息获取您周边的相关数据
    //  Privacy - Location Always Usage Description                 : 我们需要通过您的地理位置信息获取您周边的相关数据
    //  Privacy - Location When In Use Usage Description            : 使用应用期间
    
    //  坐标拾取系统：
    //  https://lbs.amap.com/console/show/picker              高德坐标拾取器
    //  https://api.map.baidu.com/lbsapi/getpoint/index.html  百度坐标拾取器
    
    //  注意：
    //  请尽量使用真机运行，模拟器运行请是设置好定位坐标。
    
    
    NSLog(@"SwpLocationInfo     = %@", SwpLocation.shareInstanceInit().swpLocationInfo);
    NSLog(@"SwpLocationVersion  = %@", SwpLocation.shareInstanceInit().swpLocationVersion);
    
    
    __weak typeof(self) weakSelf = self;
    //  初始化
    SwpLocation.shareInstanceInit()
    .swpLocationMode(SwpLocationRequestAlwaysAuthorization)
    //  打开定位
    .swpLocationOpenChain()
    //  定位失败回调
    .swpLocationErrorChain(^(SwpLocation *swpLocation, NSError *error){
        NSLog(@"%@", error);
        __strong __typeof(weakSelf)strongSelf  = weakSelf;
        strongSelf.clickLocationButton.enabled = YES;
        strongSelf.locationView.attributedText = [strongSelf attributed:@"定位失败，请重新获取" setFont:[UIFont systemFontOfSize:14] setTextFontColor:[UIColor redColor]];
    })
    //  定位成功，获取定位信息回调
    .swpLocationReverseGeocodeChain(^(SwpLocation *swpLocation, SwpLocationModel *model, NSError *error){
        
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        
        
        strongSelf.clickLocationButton.enabled = YES;
        
        if (!model.locationAddress) {
            
            strongSelf.locationView.attributedText = [strongSelf attributed:@"获取蜂窝数据权限问题，数据获取为空，请点击重新定位" setFont:[UIFont systemFontOfSize:14] setTextFontColor:[UIColor redColor]];
            return;
        }
        
        
        {
            
            NSString *GCJ02String =  [NSString stringWithFormat:@"GCJ-02「 火星坐标 」：%@,%@", model.longitudeGCJ02, model.latitudeGCJ02];
            NSLog(@"GCJ02String     = %@", GCJ02String);
            NSString *BD09String = [NSString stringWithFormat:@"BD-09   「 百度坐标 」：%@,%@", model.longitudeBD09, model.latitudeBD09];
            NSLog(@"BD09String      = %@", BD09String);
            SwpLocationCoordinate2D temp     = SwpLocationCoordinateUtilsGCJ02ToWGS84(model.latitudeGCJ02.doubleValue, model.longitudeGCJ02.doubleValue);
            NSString *WGS84String   = [NSString stringWithFormat:@"WGS-84「 国际标准坐标 」：%@,%@", @(temp.longitude), @(temp.latitude)];
            NSLog(@"WGS84String     = %@", WGS84String);
            
            strongSelf.locationView.attributedText = [strongSelf locationAttributed:model.locationAddress GCJ02S:GCJ02String BD09:BD09String WGS84:WGS84String];
        }
        
        {
            
            SwpLocationCoordinate2D GCJ02_0 = SwpLocationCoordinate2DMake(model.latitudeGCJ02.doubleValue, model.longitudeGCJ02.doubleValue);
            NSLog(@"GCJ02_0 = %@,%@", @(GCJ02_0.longitude), @(GCJ02_0.latitude));
            SwpLocationCoordinate2D WGS84_0 = SwpLocationCoordinateUtilsGCJ02ToWGS84(GCJ02_0.latitude, GCJ02_0.longitude);
            NSLog(@"WGS84_0 = %@,%@", @(WGS84_0.longitude), @(WGS84_0.latitude));
            SwpLocationCoordinate2D GCJ02_1 = SwpLocationCoordinateUtilsWGS84ToGCJ02(WGS84_0.latitude, WGS84_0.longitude);
            NSLog(@"GCJ02_1 = %@,%@", @(GCJ02_1.longitude), @(GCJ02_1.latitude));
            
            SwpLocationCoordinate2D DB_90_0 = SwpLocationCoordinate2DMake(model.latitudeBD09.doubleValue, model.longitudeBD09.doubleValue);
            NSLog(@"DB_90_0 = %@,%@", @(DB_90_0.longitude), @(DB_90_0.latitude));
            SwpLocationCoordinate2D WGS84_1 = SwpLocationCoordinateUtilsBD09ToWGS84(DB_90_0.latitude, DB_90_0.longitude);
            NSLog(@"WGS84_1 = %@,%@", @(WGS84_1.longitude), @(WGS84_1.latitude));
            SwpLocationCoordinate2D DB_90_1 = SwpLocationCoordinateUtilsWGS84ToBD09(WGS84_1.latitude, WGS84_1.longitude);
            NSLog(@"DB_90_1 = %@,%@", @(DB_90_1.longitude), @(DB_90_1.latitude));
            
        }
        
    });
}

/**
 *  @author swp_song
 *
 *  @brief  locationAttributed:BD09:WGS84:  ( 设置 AttributedString )
 *
 *  @param  GCJ02S  GCJ02S
 *
 *  @param  BD09    BD09
 *
 *  @param  WGS84   WGS84
 *
 *  @return NSAttributedString
 */
- (NSAttributedString *)locationAttributed:(NSString *)address GCJ02S:(NSString *)GCJ02S BD09:(NSString *)BD09 WGS84:(NSString *)WGS84 {
    
    UIFont *font = [UIFont systemFontOfSize:14];
    NSMutableAttributedString *attribute    = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *addressAttributed   = [self attributed:address setFont:font setTextFontColor:UIColor.swpColorWithHexadecimal(0xDA58FD)];
    NSAttributedString *GCJ02SAttributed    = [self attributed:GCJ02S setFont:font setTextFontColor:UIColor.swpColorWithHexadecimal(0x2B8FF7)];
    NSAttributedString *BD09Attributed      = [self attributed:BD09 setFont:font setTextFontColor:UIColor.swpColorWithHexadecimal(0xFD8230)];
    NSAttributedString *WGS84Attributed     = [self attributed:WGS84 setFont:font setTextFontColor:UIColor.swpColorWithHexadecimal(0x1FBF5D)];
    NSAttributedString *tempAttributed      = [self attributed:@"详细信息请看控制台打印" setFont:font setTextFontColor:UIColor.swpColorWithHexadecimal(0x23CACD)];
    
    [attribute appendAttributedString:addressAttributed];
    [attribute appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    [attribute appendAttributedString:GCJ02SAttributed];
    [attribute appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    [attribute appendAttributedString:BD09Attributed];
    [attribute appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    [attribute appendAttributedString:WGS84Attributed];
    [attribute appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    [attribute appendAttributedString:tempAttributed];
    
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithAttributedString:attribute];
    NSMutableParagraphStyle   *style      = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineSpacing                     = 15;  //增加行高
    style.alignment                       = NSTextAlignmentLeft;
    [richString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, richString.length)];
    return richString.copy;
}

/**
 *  @author swp_song
 *
 *  @brief  attributed:setFont:font:setTextFontColor:   ( 设置 AttributedString )
 *
 *  @param  text                    text
 *
 *  @param  font                    font
 *
 *  @param  fontColor               fontColor
 *
 *  @return NSAttributedString
 */
- (NSAttributedString *)attributed:(NSString *)text setFont:(UIFont *)font setTextFontColor:(UIColor *)fontColor {
    
    if (!text) return nil;
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:text];
    {
        SwpAttributedFont *swpAttributedFont       = [SwpAttributedFont new];
        swpAttributedFont.swpAttributedFont        = font;
        swpAttributedFont.swpAttributedEffectRange = NSMakeRange(0, richString.length);
        [richString addStringAttribute:swpAttributedFont];
    }
    
    {
        SwpAttributedColor *swpAttributedColor      = [SwpAttributedColor new];
        swpAttributedColor.swpAttributedColor       = fontColor;
        swpAttributedColor.swpAttributedEffectRange = NSMakeRange(0, richString.length);
        [richString addStringAttribute:swpAttributedColor];
    }
    return richString.copy;
}



#pragma mark - Init UI Methods
- (UIButton *)clickLocationButton {
    
    return !_clickLocationButton ? _clickLocationButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.enabled   = NO;
        [button setBackgroundImage:UIImage.swpCreateImageWithColor(UIColor.swpColorWithHexadecimal(0x1C75AF)) forState:UIControlStateNormal];
        [button setBackgroundImage:UIImage.swpCreateImageWithColor(UIColor.swpColorWithHexadecimal(0x1C75AF)) forState:UIControlStateHighlighted];
        [button setBackgroundImage:UIImage.swpCreateImageWithColor(UIColor.swpColorWithHexadecimal(0xA0A0A0)) forState:UIControlStateDisabled];
        button;
    }) : _clickLocationButton;
}

- (UILabel *)locationView {
    return !_locationView ? _locationView = ({
        UILabel *label      = [UILabel new];
        label.numberOfLines = 0;
        label;
    }) : _locationView;
}

@end
