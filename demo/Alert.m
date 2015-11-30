//
//  Alert.m
//  demo
//
//  Created by LiRui on 15/11/28.
//  Copyright © 2015年 Lirui. All rights reserved.
//

#import "Alert.h"
#import <UIKit/UIKit.h>
#import "WindowViewController.h"
#import "IWindow.h"
#import "BFToolNotArc.h"

@interface Alert()


@property(nonatomic,strong)IWindow * window;


@end




@implementation Alert


-(void)show
{
    self.window = [[IWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    WindowViewController * vc = [[WindowViewController alloc]init];
    self.window.backgroundColor = [UIColor blackColor];
    self.window.rootViewController = vc;
    vc.alert = self;
    vc.view.backgroundColor = [UIColor clearColor];
    
    self.window.windowLevel = UIWindowLevelNormal+1;
    [self.window makeKeyAndVisible];

    [BFToolNotArc changeOrientation:UIInterfaceOrientationLandscapeRight];

}



-(void)remove
{
    [UIView animateWithDuration:0 animations:^{
        [BFToolNotArc changeOrientation:UIInterfaceOrientationPortrait];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.window.hidden = YES;
        [self.window resignKeyWindow];
        self.window.rootViewController = nil;
        self.window = nil;
        self.window.backgroundColor = [UIColor clearColor];
    });
    
}


-(UIWindow *)getwindow
{
    return self.window;

}







@end
