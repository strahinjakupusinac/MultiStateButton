//
//  StateOff.m
//  MultiStateButton
//
//  Created by Strahinja Kupusinac on 5/9/14.
//  Copyright (c) 2014 codecentric. All rights reserved.
//

#import "StateBeta.h"

@implementation StateBeta

- (NSInteger)tag
{
    return 200;
}

- (NSString *)titleForControlState:(UIControlState)controlState
{
    return @"Beta";
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
    return [UIImage imageNamed:@"Beta"];
}

- (UIColor *)backgroundColor
{
    return [UIColor redColor];
}

@end
