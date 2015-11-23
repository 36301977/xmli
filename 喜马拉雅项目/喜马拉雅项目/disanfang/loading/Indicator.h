//
//  Indicator.h
//  由方块组成的指示器
//
//  Created by mac on 13-11-9.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Indicator : UIView{
    NSTimer *animateTimer;
    
    NSMutableArray *sviews;
}
@property (nonatomic,assign) NSUInteger numOfObjects;
@property (nonatomic,assign) CGSize objectSize;
@property (nonatomic,retain) UIColor *color;


-(void)startAnimating;

@end
