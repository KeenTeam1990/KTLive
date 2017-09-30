//
//  KTHeartFlyView.h
//  KTHeartFlyView
//
//  Created by KT on 2017/9/28.
//  Copyright © 2017年 KEENTEAM. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KTHeartFlyView : UIView

@property(nonatomic,strong) UIColor *strokeColor;
@property(nonatomic,strong) UIColor *fillColor;

- (void)animateInView:(UIView *)view;

@end
