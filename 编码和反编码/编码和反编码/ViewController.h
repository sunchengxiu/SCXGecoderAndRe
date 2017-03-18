//
//  ViewController.h
//  编码和反编码
//
//  Created by 孙承秀 on 17/2/14.
//  Copyright © 2017年 孙先森丶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController

/******  区域显示label *****/
@property(nonatomic,strong)UITextField *regionLabel;
/******  gecoderButton *****/
@property(nonatomic,strong)UIButton *gecoderBtn;
/******  recoderButton *****/
@property(nonatomic,strong)UIButton *recoderBtn;
/******  精度框 *****/
@property(nonatomic,strong)UITextField *JDTextField;
/******  纬度框 *****/
@property(nonatomic,strong)UITextField *WDTextField;
/******  编码 *****/
@property(nonatomic,strong)CLGeocoder *gecoderManager;

@end

