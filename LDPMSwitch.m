//
//  LDPMSwitch.m
//  PreciousMetals
//
//  Created by wangchao on 12/16/15.
//  Copyright © 2015 NetEase. All rights reserved.
//

#import "LDPMSwitch.h"

@interface LDPMSwitch ()

@property (strong, nonatomic) UILabel *onLabel;
@property (strong, nonatomic) UILabel *offLabel;
@property (strong, nonatomic) UIImage *backImage;
@property (strong, nonatomic) UIView *sliderView;

@end

@implementation LDPMSwitch

@synthesize on = _on;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self initWithFrame:self.frame onTitle:@"快速" offTitle:@"普通"];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self = [self initWithFrame:self.frame onTitle:@"快速" offTitle:@"普通"];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame onTitle:(NSString *)onTitle offTitle:(NSString *)offTitle
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.backImage = [UIImage imageNamed:@"LDPMSwitch_back"];
        imageView.image = self.backImage;
        [self addSubview:imageView];
        
        self.sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds) / 2., CGRectGetHeight(self.bounds))];
        self.sliderView.backgroundColor = [UIColor colorWithRGB:0x5E8BBB];
        self.sliderView.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
        [self addSubview:self.sliderView];
        
        self.onLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds))];
        self.onLabel.text = onTitle;
        self.onLabel.textColor = [NPMColor whiteTextColor];
        self.onLabel.font = [UIFont systemFontOfSize:12];
        self.onLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.onLabel];
        
        self.offLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) / 2, 0, CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds))];
        self.offLabel.text = offTitle;
        self.offLabel.textColor = [NPMColor grayTextColor];
        self.offLabel.font = [UIFont systemFontOfSize:12];
        self.offLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.offLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [self addGestureRecognizer:tap];
        
        _on = YES;
    }
    return self;
}

-(void)tapped:(UITapGestureRecognizer *)sender;
{
    if (self.tapBlock) {
        self.tapBlock(self);
    }
    self.on = !self.isOn;
}

#pragma mark - getter && setter

-(BOOL)isOn
{
    return _on;
}

-(void)setOn:(BOOL)on
{
    if (_on != on) {
        _on = on;
        if (on) {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:40 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.sliderView.center = self.onLabel.center;
                self.onLabel.textColor = [NPMColor whiteTextColor];
                self.offLabel.textColor = [NPMColor grayTextColor];
            } completion:^(BOOL finished) {
            }];
        } else {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:40 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.sliderView.center = self.offLabel.center;
                self.onLabel.textColor = [NPMColor grayTextColor];
                self.offLabel.textColor = [NPMColor whiteTextColor];
            } completion:^(BOOL finished) {
            }];
        }
    }
}

@end
