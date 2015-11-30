//
//  BFToolNotArc.m
//  BFServiceStation
//
//  Created by Eric on 10/11/13.
//  Copyright (c) 2013 Baofeng. All rights reserved.
//

#import "BFToolNotArc.h"
#import <UIKit/UIKit.h>

@implementation BFToolNotArc

+ (void)changeOrientation:(UIInterfaceOrientation)toOrientation
{
    if ([[UIDevice currentDevice] respondsToSelector:NSSelectorFromString(@"setOrientation:")]) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:[UIApplication sharedApplication].statusBarOrientation] forKey:@"orientation"];
        [[UIDevice currentDevice] performSelector:NSSelectorFromString(@"setOrientation:")
                                       withObject:(id)toOrientation];
    }
}

@end
