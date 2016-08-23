//
//  CYCountDownLabel.m
//  CYCountDownLabel
//
//  Created by 陈阳阳 on 16/8/23.
//  Copyright © 2016年 cyy. All rights reserved.
//

#import "CYCountDownLabel.h"

@implementation CYCountDownLabel
{
    NSTimer *_timer;
    int _totalSecond;
    int _countDownTime;
    BOOL _isAddTimer;
}

- (instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font {
    self = [super initWithFrame:frame];
    if (self) {
        self.second = 60;
        _isAddTimer = NO;
        self.numberOfLines = 0;
        self.text = @"获取";
        self.textColor = textColor;
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = backgroundColor;
        self.font = font;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(startCountDown:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setSecond:(int)second {
    _totalSecond = second;
}

- (void)setBeforeCountDownText:(NSString *)beforeCountDownText {
    self.text = beforeCountDownText;
}

- (void)startCountDown:(UITapGestureRecognizer *)tap {
    
    if (self.startBlock) {
       _isAddTimer = self.startBlock();
        if (_isAddTimer) {
            self.userInteractionEnabled = NO;
            _countDownTime = _totalSecond;
            _timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(showText) userInfo:nil repeats:YES];
            NSRunLoop *runloop = [NSRunLoop currentRunLoop];
            [runloop addTimer:_timer forMode:NSRunLoopCommonModes];
            [_timer fire];
        }
    }else{
        self.userInteractionEnabled = NO;
        _countDownTime = _totalSecond;
        _timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(showText) userInfo:nil repeats:YES];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addTimer:_timer forMode:NSRunLoopCommonModes];
        [_timer fire];
    }
}

- (void)showText {
    if (_countDownTime > 0) {
        NSString *text = @"";
        if (self.duringBlock) {
            text = self.duringBlock(_countDownTime);
        }else{
            text = [NSString stringWithFormat:@"重新获取验\n证码(%ds)",_countDownTime];
        }
        self.attributedText = [[NSAttributedString alloc]initWithString:text];
    }else{
        self.userInteractionEnabled = YES;
        [_timer invalidate];
        _timer = nil;
        if (self.endBlock) {
            self.text = self.endBlock();
        }else{
            self.text = @"点击重新获取";
        }
    }
    _countDownTime --;
}

@end
