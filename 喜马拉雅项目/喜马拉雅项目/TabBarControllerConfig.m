//
//  TabBarControllerConfig.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "TabBarControllerConfig.h"
#import "faxianViewController.h"
#import "dingzhiViewController.h"
#import "bofangViewController.h"
#import "xiazaiViewController.h"
#import "wodeViewController.h"

@interface TabBarControllerConfig ()

//@property (nonatomic,readonly,strong)CYLTabBarController * tabBarController;

@end

@implementation TabBarControllerConfig

-(CYLTabBarController *)tabBarController{
    if (_tabBarControllers == nil) {
        
        faxianViewController * faxianVC = [[faxianViewController alloc]init];
        UIViewController * faxianNavigationController = [[UINavigationController alloc]initWithRootViewController:faxianVC];
        
        dingzhiViewController * dingzhitingVC = [[dingzhiViewController alloc]init];
        UIViewController * dingzhiNavigationController = [[UINavigationController alloc]initWithRootViewController:dingzhitingVC];
        
        xiazaiViewController * xiazaitingVC = [[xiazaiViewController alloc]init];
        UIViewController * xiazaitingNavigationControlle = [[UINavigationController alloc]initWithRootViewController:xiazaitingVC];
        
        wodeViewController * wodeVC = [[wodeViewController alloc]init];
        UIViewController * wodeNavigationController = [[UINavigationController alloc]initWithRootViewController:wodeVC];
        
        CYLTabBarController *cyltabBarController = [[CYLTabBarController alloc]init];
        
        [self setUpTabBarItemsAttributesForController:cyltabBarController];
        [cyltabBarController setViewControllers:@[faxianNavigationController,
                                               dingzhiNavigationController,
                                               xiazaitingNavigationControlle,
                                               wodeNavigationController]];
        
        _tabBarControllers = cyltabBarController;
    }
    return self.tabBarControllers;
}

- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"发现",
                            CYLTabBarItemImage : @"tab4.png",
                            CYLTabBarItemSelectedImage : @"tab4_down.png",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"定制听",
                            CYLTabBarItemImage : @"tab1.png",
                            CYLTabBarItemSelectedImage : @"tab1_down.png",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"下载听",
                            CYLTabBarItemImage : @"tab2.png",
                            CYLTabBarItemSelectedImage : @"tab2_down.png",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"tab5.png",
                            CYLTabBarItemSelectedImage : @"tab5_down.png"
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
+ (void)customizeTabBarAppearance {
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateHighlighted];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    [[UITabBar appearance] setSelectionIndicatorImage:[self imageFromColor:[UIColor colorWithRed:26/255.0 green:163/255.0 blue:133/255.0 alpha:1] forSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/5.0f, 49) withCornerRadius:0]];
    
    // set the bar background color
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background_ios7"]];
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

@end
