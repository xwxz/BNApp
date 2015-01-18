//
//  BNWorkbenchViewController.m
//  BNApp
//
//  Created by wujianqiang on 15/1/17.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "BNWorkbenchViewController.h"
#import "BNWeatherListViewController.h"
#import "BNHomeListViewController.h"

@interface BNWorkbenchViewController ()

@end

@implementation BNWorkbenchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tabBar setBackgroundImage:[self imageFromColor:UIColorFromRGB(0x333333)]];
    
    BNWeatherListViewController *wlv = [[BNWeatherListViewController alloc] init];
    [self addViewController:wlv
                  withTitle:@"天气"
             withNormalIcon:[BNUIKitBundle imageNamed:@"icon_make_grey"]
           withSelectedIcon:[BNUIKitBundle imageNamed:@"icon_make_green"]
                    atIndex:0];
    
    BNHomeListViewController *homeViewController = [[BNHomeListViewController alloc] init];
    [self addViewController:homeViewController
                  withTitle:@"我的"
             withNormalIcon:[BNUIKitBundle imageNamed:@"icon_center_grey"]
           withSelectedIcon:[BNUIKitBundle imageNamed:@"icon_center_green"]
                    atIndex:1];
}

- (void)addViewController:(UIViewController *)viewController
                withTitle:(NSString *)title
           withNormalIcon:(UIImage *)normalIcon
         withSelectedIcon:(UIImage *)selectedIcon
                  atIndex:(NSInteger)index {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];

    NSMutableArray *alreadyExistViewControllers = [[NSMutableArray alloc] initWithArray:self.viewControllers];
    [alreadyExistViewControllers insertObject:navigationController atIndex:index];
    self.viewControllers = alreadyExistViewControllers;
    
    UITabBarItem *item = self.tabBar.items[index];
    item.title = title;
    [item setFinishedSelectedImage:selectedIcon withFinishedUnselectedImage:normalIcon];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x1EC09F)} forState:UIControlStateSelected];
}

- (UIImage *)imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[color CGColor]);
    CGContextFillRect(context, rect);
    CGContextSetAlpha(context, 0);
    UIImage * image = [[UIImage alloc] init];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
