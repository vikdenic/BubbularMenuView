//
//  BubbularMenuView.m
//  Example
//
//  Created by Vik Denic on 9/18/15.
//  Copyright (c) 2015 vik denic. All rights reserved.
//

#import "BubbularMenuView.h"

@implementation BubbularMenuView

- (instancetype)initWithMenuItemCount:(int)count andButtonCircumference:(CGFloat)circ
{
    CGFloat totalWidth = circ * (count + 1);
    CGRect frameforEncasingView = CGRectMake(0, 0, totalWidth, circ);

    self = [[BubbularMenuView alloc] initWithFrame:frameforEncasingView];

    for (int i = 0; i < count + 1; i++)
    {
        NSString *buttonTitle = [NSString stringWithFormat:@"%i", i];
        UIButton *menuItemButton = [self createButtonWithTitle:buttonTitle withCircumference:circ];
        [self addSubview:menuItemButton];
        [self sendSubviewToBack:menuItemButton];
    }

    return self;
}

-(UIButton *)createButtonWithTitle:(NSString *)title withCircumference:(CGFloat)circ
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, circ, circ)];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.borderColor = button.titleLabel.textColor.CGColor;
    //border color is CGColor because layer is a core graphic (CG) to the button

    button.layer.borderWidth = 1.0;
    button.layer.cornerRadius = button.frame.size.width/2;

    return button;
}


@end
