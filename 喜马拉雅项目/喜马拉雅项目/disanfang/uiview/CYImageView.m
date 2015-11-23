//
//  CYImageView.m
//  芒果TV
//
//  Created by MS on 15-1-9.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "CYImageView.h"

@implementation CYImageView

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tap setNumberOfTouchesRequired:1];
        [tap setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tap];

    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tap setNumberOfTouchesRequired:1];
        [tap setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tap];
    }
    return self;
}
-(void)addClickedWithTarget:(id)target action:(SEL)action withObjcet:(id)obj
{
    _target = target;
    _action = action;
    _obj = obj;
}

-(void)tapAction:(UITapGestureRecognizer*)tap
{
    
    if ([_target respondsToSelector:_action]) {
        [_target performSelector:_action withObject:_obj];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
