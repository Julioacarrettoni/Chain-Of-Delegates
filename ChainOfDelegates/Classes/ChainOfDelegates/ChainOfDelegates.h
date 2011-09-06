//
//  ChainOfDelegates.h
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChainOfDelegates : NSObject {
    NSMutableArray* chain;
	NSObject* theOneBeenObserveded;
}
// Set himself as the delegate of that object, if the object 
// already contains a delegate, that one will be set as the "master delegate"
- (void) setAsDelegateForObject:(NSObject*) theOneToBeObserved;

// Set an object as the Master Delegate of the beeing observer object
//MASTER DELEGATE: when a delegate requires a value to be return
// only the value returned by the master will be used, the others 
//will be ignored (but the methods will be call anyway)
- (void) setMasterDelegateOfChain:(NSObject*) delegate;

//Add a delegate to the chain of delegates (if there is no master, this one will become it)
- (void) addDelegateToChain:(NSObject*) delegate;

// Remove an object from the chain (if you remove the master, the second in command will take it position)
- (void) removeDelegateFromChain:(NSObject*) delegate;

// Removes all delegates
- (void) removeAllDelegatesFromChain;

@end
