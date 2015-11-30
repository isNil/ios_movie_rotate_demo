//
//  Alert.h
//  demo
//
//  Created by LiRui on 15/11/28.
//  Copyright © 2015年 Lirui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Alert : NSObject

@property(nonatomic,weak)UIViewController * fromVC;

-(void)show;

-(void)remove;

-(UIWindow *)getwindow;


@end
