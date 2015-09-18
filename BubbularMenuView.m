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
        menuItemButton.tag = i;

        [menuItemButton addTarget:self action:@selector(onMenuButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:menuItemButton];
        [self sendSubviewToBack:menuItemButton];

        if (i == 0)
        {
            self.mainButton = menuItemButton;
        }
    }

    self.dynamicAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self];

    
    [self.mainButton addTarget:self action:@selector(contractMenuButtons:) forControlEvents:UIControlEventTouchUpInside];

    return self;
}

-(void)expandMenuButtons
{
    UIButton *mainButton = self.subviews.lastObject;

    int i = 0;
    for (UIButton *menuButton in [[self.subviews reverseObjectEnumerator] allObjects])
    {
        [self snapButton:menuButton toPoint:CGPointMake(mainButton.center.x + (self.spacing * i), mainButton.center.y)];
        i++;
    }
}

-(void)contractMenuButtons:(id)sender
{
    [self.dynamicAnimator removeAllBehaviors];

    if (!self.isExpanded) {
        [self expandMenuButtons];
    }
    else
    {
        for (UIButton *menuButton in [[self.subviews reverseObjectEnumerator] allObjects])
        {
            [self snapButton:menuButton toPoint:self.mainButton.center];
        }
    }
    self.isExpanded = !self.isExpanded;
}

-(void)snapButton:(UIButton *)button toPoint:(CGPoint)point
{
    UISnapBehavior *snapBehaviour = [[UISnapBehavior alloc]initWithItem:button snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehaviour];
}

-(void)onMenuButtonTapped:(id)sender
{
    [self.delegate bubbularMenuView:self didTapMenuButton:sender];
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
