//
//  CYImageView.h
//  芒果TV
//
//  Created by MS on 15-1-9.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYImageView : UIImageView
{
    id  _target;
    SEL _action;
    id _obj;
}

-(void)addClickedWithTarget:(id)target action:(SEL)action withObjcet:(id)obj;

@end
