//
//  StateOn.m
//  MultiStateButton
//
//  Created by Strahinja Kupusinac on 5/8/14.
//  Copyright (c) 2014 codecentric. All rights reserved.
//

#import "StateAlpha.h"

@implementation StateAlpha

- (NSInteger)tag
{
    return 100;
}

- (NSString *)titleForControlState:(UIControlState)controlState
{
    return @"Alpha";
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
    return [UIImage imageNamed:@"Alpha"];
}

@end
