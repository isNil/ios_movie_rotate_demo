//
//  WindowViewController.m
//  demo
//
//  Created by LiRui on 15/11/29.
//  Copyright © 2015年 Lirui. All rights reserved.
//

#import "WindowViewController.h"
#import "Alert.h"
#import "BFToolNotArc.h"
#import "WebViewController.h"
#import "NavViewController.h"

@interface WindowViewController ()

@property(nonatomic,strong)UIImageView * playerView;

@end

@implementation WindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.playerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 220, 320, 100)];
    self.playerView.backgroundColor = [UIColor redColor];
    self.playerView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg"]];
    self.playerView.userInteractionEnabled = YES;
    [self.view addSubview:self.playerView];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.playerView addGestureRecognizer:tap];
    
}

- (void)tap
{
    
    WebViewController * web = [[WebViewController alloc]init];
    NavViewController * nav = [[NavViewController alloc]initWithRootViewController:web];
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}



- (void)click{
    self.sthidden = !self.sthidden;
    [self setNeedsStatusBarAppearanceUpdate];

}

- (void)remove{
    NSLog(@"remove key window");
    self.sthidden = YES;
    [self setNeedsStatusBarAppearanceUpdate];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.alert remove];
    });
}




-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;

}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    self.playerView.hidden = YES;
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        self.sthidden = NO;
        self.alert.getwindow.backgroundColor = [UIColor clearColor];
        [UIView setAnimationsEnabled:NO];
        self.playerView.frame = CGRectMake(0, 20, 320, 100);
        self.playerView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.sthidden = YES;
        self.playerView.frame = CGRectMake(0, 220, 320, 100);
        self.playerView.hidden = NO;
        self.alert.getwindow.backgroundColor = [UIColor blackColor];
        self.alert.getwindow.hidden = NO;
        self.playerView.frame = CGRectMake(0, 0,580, 320);
    }
    [self setNeedsStatusBarAppearanceUpdate];

}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [UIView setAnimationsEnabled:YES];
    self.playerView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
       self.playerView.transform = CGAffineTransformMakeRotation(0);
    }];
}


-(BOOL)prefersStatusBarHidden
{
    return self.sthidden;
}


-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;

}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


-(BOOL)shouldAutorotate{
    return YES;
}




@end
