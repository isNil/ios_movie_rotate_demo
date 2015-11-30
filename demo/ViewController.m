//
//  ViewController.m
//  demo
//
//  Created by LiRui on 15/11/28.
//  Copyright © 2015年 Lirui. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "Alert.h"
#import "BFToolNotArc.h"

@interface ViewController ()

@property(nonatomic,strong)Alert * alert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 1000, 100)];
    [self.view addSubview:label];
    label.text = @"测试";
    
    self.alert = [[Alert alloc]init];
    self.alert.fromVC =  self;
    [self.alert show];
}

- (void)click
{
    [self.alert show];
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;

}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
