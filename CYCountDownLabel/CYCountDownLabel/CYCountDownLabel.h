//
//  CYCountDownLabel.h
//  CYCountDownLabel
//
//  Created by 陈阳阳 on 16/8/23.
//  Copyright © 2016年 cyy. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef BOOL (^startCountDownBlock) ();

typedef NSString *(^duringCountDownBlock) (int second);

typedef NSString *(^endCountDownBlock) ();

@interface CYCountDownLabel : UILabel

/**
 *  倒计时开始
 */
@property (nonatomic,strong) startCountDownBlock startBlock;

/**
 *  倒计时期间
 */
@property (nonatomic,strong) duringCountDownBlock duringBlock;

/**
 *  倒计时结束
 */
@property (nonatomic,strong) endCountDownBlock endBlock;

/**
 *  倒计时时间 (默认60s)
 */
@property (nonatomic,assign) int second;

/**
 *  倒计时开始之前显示文字 (默认显示"获取")
 */
@property (nonatomic,strong) NSString *beforeCountDownText;

- (instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font;

@end
