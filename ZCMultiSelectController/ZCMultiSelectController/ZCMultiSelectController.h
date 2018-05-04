//
//  ZCMultiSelectController.h
//  xxoogo
//
//  Created by Huang Zhicong on 2018/4/28.
//  Copyright © 2018年 xinchidao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCMultiSelectController : UIViewController

-(void)setUp:(NSArray<NSString*>*)titleArr controllerArr:(NSArray<UIViewController*>*)controllerArr;

-(void)setTopViewColor:(UIColor*)color selectedColor:(UIColor*)selectColor;
@end
