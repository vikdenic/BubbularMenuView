//
//  BubbularMenuView.h
//  Example
//
//  Created by Vik Denic on 9/18/15.
//  Copyright (c) 2015 vik denic. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BubbularMenuView;

@protocol BubbularMenuViewDelegate <NSObject>

@required

-(void)bubbularMenuView:(BubbularMenuView *)menuView didTapMenuButton:(UIButton *)menuButton;

@end

@interface BubbularMenuView : UIView

@property id<BubbularMenuViewDelegate> delegate;

@property UIDynamicAnimator *dynamicAnimator;
@property UIButton *mainButton;

@property int buttonCount;
@property CGFloat buttonCircumference;
@property (nonatomic) CGFloat spacing;
@property BOOL isExpanded;

-(instancetype)initWithMenuItemCount:(int)count andButtonCircumference:(CGFloat)circ;
-(void)expandMenuButtons;

@end
