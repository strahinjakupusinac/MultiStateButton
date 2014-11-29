//
//  CCMultiStateButton.h
//  MultiStateButton
//
//  Created by Strahinja Kupusinac on 5/7/14.
//  Copyright (c) 2014 codecentric. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SKUMultiStateButtonState <NSObject>

@required

- (NSString *)titleForControlState:(UIControlState)controlState;
- (UIColor *)titleColorForControlState:(UIControlState)controlState;
- (UIImage *)backgroundImageForControlState:(UIControlState)controlState;
- (UIColor *)backgroundColor;

@optional

- (NSInteger) tag;

@end

@interface SKUMultiStateButton : UIButton

/** */
- (NSArray *)states;

/** */
- (void)addState:(id<SKUMultiStateButtonState>)state;

/** */
- (void)removeState:(id<SKUMultiStateButtonState>)state;

/** */
- (void)removeStatesWithTag:(NSInteger)tag;

/** Takes the button to the next state */
- (void)nextState;

/** Returns the current button state */
- (id<SKUMultiStateButtonState>)currentState;

@end
