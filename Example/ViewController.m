//
//  ViewController.m
//  Example
//
//  Created by Vik Denic on 9/18/15.
//  Copyright (c) 2015 vik denic. All rights reserved.
//

#import "ViewController.h"
#import "BubbularMenuView.h"

@interface ViewController () <BubbularMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    BubbularMenuView *menuView = [[BubbularMenuView alloc] initWithMenuItemCount:3 andButtonCircumference:50];
    menuView.delegate = self;
    [self.view addSubview:menuView];

    menuView.spacing = 75;
    [menuView expandMenuButtons];
}

-(void)bubbularMenuView:(BubbularMenuView *)menuView didTapMenuButton:(UIButton *)menuButton
{
    
}

@end
