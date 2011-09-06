//
//  TextFieldVisualDelegate.m
//  ChainOfDelegates
//
//  Created by Julio Andrés Carrettoni on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextFieldVisualDelegate.h"

@implementation TextFieldVisualDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	NSString* msg = @"You selected the textField";
	UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"textFieldDidBeginEditing" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

@end
