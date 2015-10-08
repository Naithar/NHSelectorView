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
    self.selectorView.backgroundColor = [UIColor greenColor];
    self.selectorView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.selectorView];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.selectorView.selectionSize = CGSizeMake(5, 5);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.selectorView.selectionStyle = NHSelectorViewSelectionStyleLine;
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
