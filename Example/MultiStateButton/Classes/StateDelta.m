//
//  StateDelta.m
//  MultiStateButton
//
//  Created by Strahinja Kupusinac on 7/22/14.
//  Copyright (c) 2014 codecentric. All rights reserved.
//

#import "StateDelta.h"

@implementation StateDelta

- (NSInteger)tag
{
    return 400;
}

- (NSString *)titleForControlState:(UIControlState)controlState
{
    return @"Delta";
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
    return [UIImage imageNamed:@"Delta"];
}

@end
