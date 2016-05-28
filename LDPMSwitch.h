//
//  LDPMSwitch.h
//  PreciousMetals
//
//  Created by wangchao on 12/16/15.
//  Copyright © 2015 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDPMSwitch : UIView

-(instancetype)initWithFrame:(CGRect)frame onTitle:(NSString *)onTitle offTitle:(NSString *)offTitle;

@property (strong, nonatomic) ActionBlock tapBlock;
@property (assign, nonatomic, getter=isOn) BOOL on;

@end
