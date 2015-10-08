//
//  NViewController.m
//  NHSelectionView
//
//  Created by Naithar on 10/08/2015.
//  Copyright (c) 2015 Naithar. All rights reserved.
//

#import "NViewController.h"
#import <NHSelectorView/NHSelectorView.h>

@interface NViewController ()

@property NHSelectorView *selectorView;

@end

@implementation NViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.selectorView = [[NHSelectorView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 60)];
    [self.selectorView setItems:@[@"one", @"two", @"three"]];
    self.selectorView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.selectorView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
