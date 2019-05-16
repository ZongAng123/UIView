//
//  ViewController.m
//  UIViewDemo
//
//  Created by 纵昂 on 2019/5/15.
//  Copyright © 2019 GitHub:https://github.com/ZongAng123. All rights reserved.
//

#import "ViewController.h"
#import "OneFreshView.h"
#import "TwoFreshView.h"

#define TFScreen_Width [UIScreen mainScreen].bounds.size.width
#define TFScreen_Height [UIScreen mainScreen].bounds.size.height
#define TFMain_Width self.frame.size.width
#define TFMain_Height self.frame.size.height
#define TFTabbar_Height self.tabBarController.tabBar.bounds.size.height

@interface ViewController ()
@property(nonatomic,strong) OneFreshView *onemV_main;
@property(nonatomic,strong) TwoFreshView *twomV_main;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    －两个UIView之间切换的动画效果
    self.title=@"View视图之间切换";
/**
 view.hidden = YES
 第一种状态：view1.hidden = YES     view2.hidden = NO
 第二种状态：view2.hidden = YES     view1.hidden = NO
 这样实现同一个位置，两个不同view的隐藏和展现
 
 **/
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 70, TFScreen_Width, 260)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 70, TFScreen_Width, 260)];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"点我切换" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor yellowColor];
    button.frame = CGRectMake(100, 500, 100, 30);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void)buttonClick{
    
    [UIView beginAnimations:nil context:nil];
    //持续时间
    [UIView setAnimationDuration:4.0];
    //在出动画的时候减缓速度
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    //添加动画开始及结束的代理
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(begin)];
    [UIView setAnimationDidStopSelector:@selector(stopAni)];
    //动画效果
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
    
}

- (void)begin{
    NSLog(@"begin");
}


- (void)stopAni{
    NSLog(@"stop");
}

/**
 – addSubview:  （常用增加视图在本View上面）
 – bringSubviewToFront；将新视图放在其他同级视图的top位置
 – insertSubview:atIndex:  将新视图放在第index层，index是从底层向上数的下标位置
 – insertSubview:aboveSubview:将新视图放在第二个参数view的上面
 – insertSubview:belowSubview:将新视图放在第二个参数view的下面
 – exchangeSubviewAtIndex:withSubviewAtIndex:改变新视图从第一个位置到第二个位置
 **/


@end
