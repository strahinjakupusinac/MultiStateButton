//
//  CCMultiStateButton.m
//  MultiStateButton
//
//  Created by Strahinja Kupusinac on 5/7/14.
//  Copyright (c) 2014 codecentric. All rights reserved.
//

#import "SKUMultiStateButton.h"

@interface SKUMultiStateButton ()

@property (strong, nonatomic) NSMutableArray *states;
@property (nonatomic) NSInteger currentStateIndex;

/** Control states for which to apply the appearance */
@property (strong, nonatomic) NSArray *controlStates;

@end

@implementation SKUMultiStateButton

- (id)init
{
    self = [super init];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.states = [[NSMutableArray alloc] init];
    self.currentStateIndex = -1;
    self.controlStates = @[@(UIControlStateNormal),
                           @(UIControlStateHighlighted),
                           @(UIControlStateDisabled),
                           @(UIControlStateSelected)];
    
    [self addTarget:self action:@selector(pressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addState:(id<SKUMultiStateButtonState>)state
{
    [_states addObject:state];
    if (self.currentState == nil)
    {
        [self nextState];
    }
}

- (void)removeState:(id<SKUMultiStateButtonState>)state
{
    NSUInteger stateIndex = [_states indexOfObject:state];
    while (stateIndex != NSNotFound)
    {
        [_states removeObjectAtIndex:stateIndex];
        if (stateIndex == self.currentStateIndex)
        {
            [self nextState];
        }
        stateIndex = [_states indexOfObject:state];
    }
}

- (void)removeStatesWithTag:(NSInteger)tag
{
    for (id<SKUMultiStateButtonState> state in _states)
    {
        if (state.tag == tag)
        {
            [self removeState:state];
        }
    }
}

- (id<SKUMultiStateButtonState>)currentState
{
    if (self.currentStateIndex < 0)
    {
        return nil;
    }
    else
    {
        return self.states[self.currentStateIndex];
    }
}

- (void)nextState
{
    if (self.states.count != 0)
    {
        if (self.currentState < 0)
        {
            self.currentStateIndex = 0;
        }
        else
        {
            self.currentStateIndex += 1;
            
            if (self.currentStateIndex >= self.states.count)
            {
                self.currentStateIndex = 0;
            }
        }
    }
    else
    {
        self.currentStateIndex = -1;
        // TODO: apply initial state
    }
    
    [self applyStateAppearance];
}

- (void)applyStateAppearance
{
    id<SKUMultiStateButtonState> currentState = self.currentState;
    for (NSNumber *controlState in self.controlStates)
    {
        [UIView transitionWithView:self
                          duration:0.1f
                           options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                               [self setBackgroundImage:[currentState backgroundImageForControlState:controlState.intValue] forState:controlState.intValue];                               
                               [self setTitle:[currentState titleForControlState:controlState.intValue] forState:controlState.intValue];
                               [self setTitleColor:[currentState titleColorForControlState:controlState.intValue] forState:controlState.intValue];
                           }
                        completion:^(BOOL finished) {
                            
                        }
         ];
    }
    [self setBackgroundColor:[currentState backgroundColor]];
}

- (void)pressed
{
    [self nextState];
}

@end
