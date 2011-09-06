//
//  ChainOfDelegatesAppDelegate.h
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChainOfDelegatesViewController;

@interface ChainOfDelegatesAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ChainOfDelegatesViewController *viewController;

@end
