//
//  BubbularMenuView.h
//  Example
//
//  Created by Vik Denic on 9/18/15.
//  Copyright (c) 2015 vik denic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbularMenuView : UIView

@property UIDynamicAnimator *dynamicAnimator;

-(instancetype)initWithMenuItemCount:(int)count andButtonCircumference:(CGFloat)circ;
-(void)fanButtonsOut;

@end
