//
//  UIView+UIView_ZCExtension.m
//  RentAdmin
//
//  Created by Huang Zhicong on 2017/8/14.
//  Copyright © 2017年 hzc. All rights reserved.
//

#import "UIView+UIView_ZCExtension.h"
@interface UIView()
@property(nonatomic,strong)UITextView * textV;
@property(nonatomic,copy)void (^zcBlock)(NSString* txt);
@end
@implementation UIView (UIView_ZCExtension)

- (CGSize)xmg_size
{
    return self.frame.size;
}

- (void)setXmg_size:(CGSize)xmg_size
{
    CGRect frame = self.frame;
    frame.size = xmg_size;
    self.frame = frame;
}

- (CGFloat)xmg_width
{
    return self.frame.size.width;
}

- (CGFloat)xmg_height
{
    return self.frame.size.height;
}

- (void)setXmg_width:(CGFloat)xmg_width
{
    CGRect frame = self.frame;
    frame.size.width = xmg_width;
    self.frame = frame;
}

- (void)setXmg_height:(CGFloat)xmg_height
{
    CGRect frame = self.frame;
    frame.size.height = xmg_height;
    self.frame = frame;
}

- (CGFloat)xmg_x
{
    return self.frame.origin.x;
}

- (void)setXmg_x:(CGFloat)xmg_x
{
    CGRect frame = self.frame;
    frame.origin.x = xmg_x;
    self.frame = frame;
}

- (CGFloat)xmg_y
{
    return self.frame.origin.y;
}

- (void)setXmg_y:(CGFloat)xmg_y
{
    CGRect frame = self.frame;
    frame.origin.y = xmg_y;
    self.frame = frame;
}

- (CGFloat)xmg_centerX
{
    return self.center.x;
}

- (void)setXmg_centerX:(CGFloat)xmg_centerX
{
    CGPoint center = self.center;
    center.x = xmg_centerX;
    self.center = center;
}


- (CGFloat)xmg_centerY
{
    return self.center.y;
}

- (void)setXmg_centerY:(CGFloat)xmg_centerY
{
    CGPoint center = self.center;
    center.y = xmg_centerY;
    self.center = center;
}




@end
