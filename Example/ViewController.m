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

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    BubbularMenuView *menuView = [[BubbularMenuView alloc] initWithMenuItemCount:3 andButtonCircumference:self.view.frame.size.width / 8];
    menuView.delegate = self;
    menuView.spacing = self.view.frame.size.width / 3.5;
    menuView.direction = BubbularDirectionHorizontal;
    menuView.images = [self imagesArray];
    menuView.buttonBorderColor = [self customRedColor];
    menuView.buttonBorderWidth = 0;

    [self.view addSubview:menuView];
}

#pragma mark - BubbularMenuViewDelegate callback
-(void)bubbularMenuView:(BubbularMenuView *)menuView didTapMenuButton:(UIButton *)menuButton
{
    NSLog(@"%ld", (long)menuButton.tag);
}

#pragma mark - Helpers
-(NSArray *)imagesArray
{
    UIImage *mainImage = [UIImage imageNamed:@"navicon"];
    UIImage *menuImage1 = [UIImage imageNamed:@"envelope"];
    UIImage *menuImage2 = [UIImage imageNamed:@"bell"];
    UIImage *menuImage3 = [UIImage imageNamed:@"gear"];

    return @[mainImage, menuImage1, menuImage2, menuImage3];
}

-(UIColor *)customRedColor
{
    return [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1];
}

@end
