//
//  ChainOfDelegates.m
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChainOfDelegates.h"


@implementation ChainOfDelegates

#pragma mark - Overrided NSObject methods
- (void) dealloc
{
	[chain release];
	chain = nil;
	
	theOneBeenObserveded = nil;
	
	[super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        chain = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Implementation of public methods
// Set himself as the delegate of that object, if the object 
// already contains a delegate, that one will be set as the "master delegate"
- (void) setAsDelegateForObject:(NSObject*) theOneToBeObserved
{
	SEL selector = @selector(delegate);
	
	if ([theOneToBeObserved respondsToSelector:selector])
	{
		theOneBeenObserveded = theOneToBeObserved;
		
		NSObject* masterDelegate = [theOneToBeObserved performSelector:selector];
		[self setMasterDelegateOfChain:masterDelegate];
		[theOneToBeObserved performSelector:@selector(setDelegate:) withObject:self];
	}
}

//Some objects cache the 'capabilities' of their delegate, so each time we
// add or remove one observer to the chain, we trait it as if we are
// changing the delegate of the observee
- (void) refreshObservee
{
	[theOneBeenObserveded performSelector:@selector(setDelegate:) withObject:self];
}

// Set an object as the Master Delegate of the beeing observer object
- (void) setMasterDelegateOfChain:(NSObject*) delegate
{
	if (!delegate)
		return;
	
	if (![chain containsObject:delegate])
	{
		[chain addObject:delegate];
	}
	else
	{
		[delegate retain];
		[chain removeObject:delegate];
		[chain addObject:delegate];
		[delegate release];
	}
	
	[self refreshObservee];
}

//Add a delegate to the chain of delegates (if there is no master, this one will become it)
- (void) addDelegateToChain:(NSObject*) delegate
{
	if (!delegate)
		return;
	
	if (![chain containsObject:delegate])
	{
		[chain insertObject:delegate atIndex:0];
	}
	
	[self refreshObservee];
}

// Remove an object from the chain (if you remove the master, the second in command will take it position)
- (void) removeDelegateFromChain:(NSObject*) delegate
{
	if (!delegate)
		return;
	
	[chain removeObject:delegate];
	[self refreshObservee];
}

// Removes all delegates
- (void) removeAllDelegatesFromChain
{
	[chain removeAllObjects];
	[self refreshObservee];
}

#pragma mark - Hacky stuff to 'listen' to all events and manage chain of delegates
- (BOOL)respondsToSelector:(SEL)aSelector
{
	for (NSObject* obj in chain)
	{
		if ([obj respondsToSelector:aSelector])
		{
			return YES;
		}
	}
	return [super respondsToSelector:aSelector];
}


- (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
	for (NSObject* obj in chain)
	{
		if ([obj conformsToProtocol:aProtocol])
		{
			return YES;
		}
	}
	return [super conformsToProtocol:aProtocol];
}

- (void)forwardInvocation:(NSInvocation*)invocation
{
	SEL aSelector = [invocation selector];
	
	if (![self respondsToSelector:aSelector])
	{
		[self doesNotRecognizeSelector:aSelector];
	}
	
	for (NSObject* obj in chain)
	{
		if ([obj respondsToSelector:aSelector])
		{
			[invocation invokeWithTarget:obj];
		}
	}
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
	NSMethodSignature* methodSignature = nil;
	if (chain.count > 0)
	{
		methodSignature = [[chain objectAtIndex:0] methodSignatureForSelector:aSelector];
	}
	return methodSignature;
}

@end
