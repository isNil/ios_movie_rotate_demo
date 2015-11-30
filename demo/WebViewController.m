//
//  WebViewController.m
//  demo
//
//  Created by LiRui on 15/11/30.
//  Copyright © 2015年 Lirui. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"弹出的页面";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [self setNeedsStatusBarAppearanceUpdate];
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    });
    
    
}


-(BOOL)prefersStatusBarHidden
{
    return NO;
}




@end
