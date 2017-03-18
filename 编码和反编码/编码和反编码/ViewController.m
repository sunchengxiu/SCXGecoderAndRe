//
//  ViewController.m
//  编码和反编码
//
//  Created by 孙承秀 on 17/2/14.
//  Copyright © 2017年 孙先森丶. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.regionLabel];
    [self.view addSubview:self.JDTextField];
    [self.view addSubview:self.WDTextField];
    [self.view addSubview:self.gecoderBtn];
    [self.view addSubview:self.recoderBtn];
}

-(UITextField *)regionLabel{

    if (_regionLabel == nil) {
        _regionLabel = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2, 100, 200, 200)];
        _regionLabel.placeholder = @"区域名";
        [_regionLabel setText:@""];
    }
    return _regionLabel;

}
-(UITextField *)JDTextField{
    
    if (_JDTextField == nil) {
        _JDTextField = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 100)/2, 350, 100, 50)];
        [_JDTextField setPlaceholder:@"经度"];
    }
    return _JDTextField;
}
-(UITextField *)WDTextField{
    
    if (_WDTextField == nil) {
        _WDTextField = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 100)/2, 450, 100, 50)];
        [_WDTextField setPlaceholder:@"纬度"];
    }
    return _WDTextField;
}
-(UIButton *)gecoderBtn{
    if (_gecoderBtn == nil) {
        _gecoderBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 100)/2, 550, 100, 50)];
        _gecoderBtn.backgroundColor = [UIColor blueColor];
        [_gecoderBtn setTitle:@"编码" forState:UIControlStateNormal];
        [_gecoderBtn addTarget: self action:@selector(gecoder) forControlEvents:UIControlEventTouchUpInside];
    }
    return _gecoderBtn;
}
-(UIButton *)recoderBtn{
    if (_recoderBtn == nil) {
        _recoderBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 100)/2, 650, 100, 50)];
        _recoderBtn.backgroundColor = [UIColor blueColor];
        [_recoderBtn setTitle:@"反编码" forState:UIControlStateNormal];
        [_recoderBtn addTarget: self action:@selector(regecoder) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recoderBtn;
}
-(CLGeocoder *)gecoderManager{
    if (_gecoderManager == nil) {
        _gecoderManager = [[CLGeocoder alloc]init];
    }
    return _gecoderManager;
}
- (void)gecoder{
    [self.gecoderManager geocodeAddressString:self.regionLabel.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        if (error) {
            self.regionLabel.text = [NSString stringWithFormat:@"%@",error];
             NSLog(@"编码错误");
        }
        else{
            NSLog(@"编码成功 ");
            CLPlacemark *placeMark = placemarks.firstObject;
            self.JDTextField.text = [NSString stringWithFormat:@"%f",placeMark.location.coordinate.latitude] ;
            self.WDTextField.text = [NSString stringWithFormat:@"%f",placeMark.location.coordinate.longitude] ;
        }
    }];
}
- (void)regecoder{
    CLLocationDegrees latitude =  (CLLocationDegrees) (self.JDTextField.text ? ([self.JDTextField.text doubleValue]) : 0.0);
     CLLocationDegrees longitude =  (CLLocationDegrees) (self.WDTextField.text ? ([self.WDTextField.text doubleValue]) : 0.0);
    CLLocation *location = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    [self.gecoderManager reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            self.regionLabel.text = [NSString stringWithFormat:@"%@",error];
            NSLog(@"反编码错误");
        }
        else{
            NSLog(@"编码成功 ");
            if (placemarks == nil) {
                return ;
            }
            else{
                CLPlacemark *placeMark = placemarks.firstObject;
                self.regionLabel.text = placeMark.name;
            }
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
