//
//  SKUViewController.m
//  MultiStateButton
//
//  Created by Strahinja Kupusinac on 11/29/2014.
//  Copyright (c) 2014 Strahinja Kupusinac. All rights reserved.
//

#import <MultiStateButton/SKUMultiStateButton.h>
#import "SKUViewController.h"
#import "StateAlpha.h"
#import "StateBeta.h"
#import "StateGamma.h"
#import "StateDelta.h"

@interface SKUViewController ()

@property (weak, nonatomic) IBOutlet SKUMultiStateButton *multiStateButton;

@end

@implementation SKUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Setup multi state button
    StateAlpha *stateAlpha = [[StateAlpha alloc] init];
    StateBeta *stateBeta = [[StateBeta alloc] init];
    StateGamma *stateGamma = [[StateGamma alloc] init];
    StateDelta *stateDelta = [[StateDelta alloc] init];
    [self.multiStateButton addState:stateAlpha];
    [self.multiStateButton addState:stateBeta];
    [self.multiStateButton addState:stateGamma];
    [self.multiStateButton addState:stateDelta];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
