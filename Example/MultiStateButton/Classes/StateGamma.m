//
//  StateGamma.m
//  MultiStateButton
//
//  Created by Strahinja Kupusinac on 5/9/14.
//  Copyright (c) 2014 codecentric. All rights reserved.
//

#import "StateGamma.h"

@implementation StateGamma

- (NSInteger)tag
{
    return 300;
}

- (NSString *)titleForControlState:(UIControlState)controlState
{
    return @"Gamma";
}

- (UIColor *)titleColorForControlState:(UIControlState)controlState
{
    switch (controlState) {
        case UIControlStateNormal:
            return [UIColor blackColor];
            break;
        case UIControlStateHighlighted:
            return [UIColor grayColor];
            break;
        default:
            return nil;
            break;
    }
}

- (UIImage *)backgroundImageForControlState:(UIControlState)controlState
{
    return [UIImage imageNamed:@"Gamma"];
}

@end
